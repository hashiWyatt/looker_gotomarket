# datagroup: terraform_cloud_tracks_view_datagroup {
#   sql_trigger: SELECT date_trunc('day', max(sent_at)) FROM terraform_cloud.tracks ;;
#   max_cache_age: "24 hours"
#   label: "New day of data"
#   description: "Triggered when new day of events starts"
# }

view: terraform_cloud_user_org_events_with_plan {
  derived_table: {
    sql: with
     hardcoded_plan_costs_because_im_the_worst as (
      select * from
        (
          select 'Team' as plan, 20 as cost
          union
          select 'Trial' as plan, 0 as cost
          union
          select 'Limited User Preview' as plan, 0 as cost
          union
          select 'Self-serve Preview' as plan, 0 as cost
          union
          select 'Legacy Paid Accounts' as plan, 65000 as cost
          union
          select 'Business' as plan, 65000 as cost
          union
          select 'Governance and Policy' as plan, 70 as cost
          union
          select 'Free' as plan, 0 as cost
        )
     ),
     service_account_org_lookup as (
        select distinct
          id as user_id,
--          case
--          when email like '%-webhooks-%' then replace(regexp_replace(email, '.*-webhooks-', ''),'@hashicorp.com','')
--          when email like 'api-org-%' then replace(replace(email, 'api-org-', ''),'@hashicorp.com','')

--          end as organization,
                  email
                from terraform_cloud.users
                where email_domain = 'hashicorp.com' and (email like 'api-org-%' or email like '%-webhooks-%')
      ),
      org_org_id_lookup as (
        select distinct lower(organization) as organization, organization_id from terraform_cloud.add_user_to_team where organization_id is not null
      ),
--      service_account_org_owner_lookup as (
--        select
--          service_account_org_lookup.*,
--          organization_id
--        from service_account_org_lookup, org_org_id_lookup where service_account_org_lookup.organization = org_org_id_lookup.organization
--      ),
      --backfill_user_orgs as (
      --  select user_id, first_value(organization_id) over (partition by user_id order by sent_at rows between unbounded preceding and unbounded following) as organization_id from terraform_cloud.show_workspace where organization_id is not null
      --),
      user_org_lookup as (
        select distinct user_id, organization_id from terraform_cloud.add_user_to_team where organization_id is not null
--        union
--        select user_id, organization_id from service_account_org_owner_lookup
      ),
      backfill_legacy_orgs as (
        select
          organization_id,
          organization,
          min(sent_at) as sent_at
        from terraform_cloud.add_user_to_team
        group by 1, 2
      ),
      full_union_users as (
        select
          coalesce(create_account.id, users.id) as entity_id,
          coalesce(sent_at, received_at) as sent_at,
          email,
          email_domain
        from (
          select user_id as id, coalesce(sent_at, received_at) as sent_at from terraform_cloud.create_account
          union
          (select id, min(sent_at) as sent_at from (
            select organization_id as id, coalesce(sent_at, received_at) as sent_at from terraform_cloud.create_organization
            union
            select organization_id as id, sent_at from backfill_legacy_orgs
            ) group by 1
          )
        ) create_account
        full outer join terraform_cloud.users
        on create_account.id = users.id
      ),
      users as (
        select
--            case when split_part(entity_id, '-', 1) = 'org'
--            then 'org'
--            else 'user'
--          end as entity_type,
          entity_id,
          to_char(date_trunc('week', sent_at), 'YYYY-MM-DD') as entity_cohort,
--          case when split_part(entity_id, '-', 1) = 'org'
--            then entity_id
--            else
                user_org_lookup.organization_id
--                end
            as organization_id,
          email,
          email_domain
        from full_union_users
        left join user_org_lookup on
        entity_id = user_org_lookup.user_id
      ),
      events as (
        select
          event_text,
          event,
          user_id,
          sent_at as event_at
        from terraform_cloud.tracks
      ),
      subscriptions as (
        select
          update_org_subscription.organization_id,
          new_subscription_plan as plan,
          sent_at as start_at,
          min(next_plan.start_at) as end_at
        from
          terraform_cloud.update_org_subscription
        left join (
          select
            organization_id,
            sent_at as start_at
          from terraform_cloud.update_org_subscription
        ) as next_plan
        on update_org_subscription.organization_id = next_plan.organization_id
        and update_org_subscription.sent_at < next_plan.start_at
        group by 1, 2, 3
      )

-- couldn't use the backfill_user_orgs because of performance issues
      select
--        users.entity_type,
        users.entity_id,
        users.entity_cohort,
        users.organization_id,
        users.email,
        users.email_domain,
        subscriptions.plan, event_text, event, event_at,
        hardcoded_plan_costs_because_im_the_worst.cost
      from
        users
      inner join events on
        users.entity_id = events.user_id
      --left join backfill_user_orgs on
      --  users.organization_id is null and users.entity_id = backfill_user_orgs.user_id
      left join subscriptions on
        users.organization_id = subscriptions.organization_id and
        subscriptions.start_at <= events.event_at and (events.event_at <= subscriptions.end_at OR subscriptions.end_at is null)
      left join hardcoded_plan_costs_because_im_the_worst on
        subscriptions.plan = hardcoded_plan_costs_because_im_the_worst.plan
       ;;
#      persist_for: "24 hours"
#      indexes: ["entity_id", "entity_type", "organization_id", "entity_cohort", "email", "email_domain", "plan", "event", "event_text", "event_at"]
#      publish_as_db_view: yes
#      distribution_style: all
#      datagroup_trigger: terraform_cloud_tracks_view_datagroup
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_orgs {
    type:  count_distinct
    sql: ${organization_id} ;;
  }
  measure: distinct_entities {
    type:  count_distinct
    sql: ${entity_id} ;;
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension: entity_cohort {
    type: string
    sql: ${TABLE}.entity_cohort ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: path_org {
    type: string
    sql: ${TABLE}.path_org ;;
  }

  dimension: path_workspace {
    type: string
    sql: ${TABLE}.path_workspace ;;
  }

  set: detail {
    fields: [
      entity_id,
      entity_type,
      organization_id,
      entity_cohort,
      email,
      email_domain,
      plan,
      event_text,
      event,
      event_at_time,
      path_org,
      path_workspace
    ]
  }
}
