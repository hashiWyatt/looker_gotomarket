view: terraform_cloud_active_users {
  derived_table: {
    sql: with org_events as (
  select organization_id, name, min(created_at) over (partition by organization_id, name) as created_at, coalesce(lead(created_at) over (partition by name order by created_at), getdate()+'1 day'::interval) as end_at from (
    select organization_id, organization as name, min(sent_at) as created_at, max(sent_at) as end_at from terraform_cloud.org_created_workspace where organization_id is not null group by organization_id, organization
    union
    select organization_id, organization as name, min(sent_at) as created_at, max(sent_at) as end_at from terraform_cloud.show_workspace where organization_id is not null group by organization_id, organization
  )
),
matched_org_ids as (
  select
      user_id as organization_id,
      organization as name,
      sent_at as created_at,
      coalesce(lead(sent_at) over (partition by organization order by sent_at), getdate()+'1 day'::interval) as end_at
    from terraform_cloud.org_created_organization

    union

    select organization_id, name, min(created_at) as created_at, max(end_at) as end_at from org_events group by organization_id, name
),
backfilled_org_ids as (
  select
    organization_id,
    name,
    min(created_at) as created_at,
    max(end_at) as end_at
  from matched_org_ids
  group by organization_id, name
),
org_id_lookups as (
  select organization_id, name, created_at, end_at, min(created_at) over (partition by name) as earliest_at, max(end_at) over (partition by name) as latest_at from backfilled_org_ids
),
user_org_state_versions as (
  select
    sent_at,
    user_id,
    organization,
    org_id_lookups.organization_id
  from terraform_cloud.state_version_created
  left join org_id_lookups
  on state_version_created.organization = org_id_lookups.name and
    (
      (state_version_created.sent_at < org_id_lookups.earliest_at and
      org_id_lookups.created_at = org_id_lookups.earliest_at
      ) OR
      (state_version_created.sent_at >= org_id_lookups.created_at and
       state_version_created.sent_at < org_id_lookups.end_at
      ) OR
      (state_version_created.sent_at >= org_id_lookups.latest_at and
      org_id_lookups.end_at = org_id_lookups.latest_at)
    )

),
      user_applies as (
        select
          date_trunc('day', sent_at) as event_at,
          user_id,
          organization_id,
          'apply' as event,
          count(*) as count
        from user_org_state_versions
        group by 1, 2, 3
      ),
      events as (
        select
          date_trunc('day', sent_at) as event_at,
          user_id,
          '' as organization_id,
          event,
          count(*) as count
        from terraform_cloud.tracks
        group by 1, 2, 3, 4
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
      ),
      users as (
        select
          coalesce(create_account.user_id, users.id) as user_id,
          to_char(date_trunc('week', sent_at), 'YYYY-MM-DD') as user_cohort,
          email,
          email_domain,
          is_service_account
        from terraform_cloud.create_account
        full outer join terraform_cloud.users
        on create_account.user_id = users.id
      ),
      user_activity as (
        select
          user_events.event_at,
          user_events.organization_id,
          to_char(date_trunc('week', org_created_organization.sent_at), 'YYYY-MM-DD') as org_cohort,
          user_events.user_id,
          user_cohort,
          email,
          email_domain,
          subscriptions.plan,
          user_events.event,
          user_events.count as actions
        from
          (select * from user_applies
           union
           select * from events) as user_events
        left join subscriptions
        on
          user_events.organization_id = subscriptions.organization_id and
          subscriptions.start_at <= user_events.event_at and (user_events.event_at <= subscriptions.end_at OR subscriptions.end_at is null)
        left join terraform_cloud.org_created_organization
        on
          user_events.organization_id = org_created_organization.organization_id
        left join users
        on
          user_events.user_id = users.user_id
        where
          (email_domain <> 'hashicorp.com' or email_domain is null)
          and (is_service_account is false)
      )

      select * from user_activity
       ;;
  }

  dimension_group: current_time {
    type: time
    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]
    sql: CURRENT_TIMESTAMP::TIMESTAMP ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: distinct_org {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
  }

  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: org_cohort {
    type: string
    sql: ${TABLE}.org_cohort ;;
  }

  dimension: event {
    type: string
    sql:  ${TABLE}.event ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_cohort {
    type: string
    sql: ${TABLE}.user_cohort ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: actions {
    type: number
    sql: ${TABLE}.actions ;;
  }

  set: detail {
    fields: [
      event_at_time,
      organization_id,
      org_cohort,
      user_id,
      user_cohort,
      plan,
      actions,
      event
    ]
  }
}
