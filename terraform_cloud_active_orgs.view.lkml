view: terraform_cloud_active_orgs {
  derived_table: {
    sql: with org_user_actions as (
        select
          date_trunc('day', sent_at) as event_at,
          organization_id,
          user_id,
          count(*) as count
        from terraform_cloud.show_workspace
        group by 1, 2, 3
      ),
      org_active_users as (
        select
          event_at,
          organization_id,
          count(distinct user_id) as count
        from org_user_actions
        group by 1, 2
      ),
      org_applies as (
        select
          date_trunc('day', sent_at) as event_at,
          organization_id,
          count(*) as count
        from terraform_cloud.org_created_state_version
        group by 1, 2
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
          email_domain
        from terraform_cloud.create_account
        full outer join terraform_cloud.users
        on create_account.user_id = users.id
      ),
      org_activity as (
        select
          org_active_users.event_at,
          org_active_users.organization_id,
          to_char(date_trunc('week', org_created_organization.sent_at), 'YYYY-MM-DD') as org_cohort,
          subscriptions.plan,
          org_applies.count as applies,
          org_active_users.count as active_users
        from org_active_users, org_applies, subscriptions, terraform_cloud.org_created_organization
        left join
        users
        on org_created_organization.user_id = users.user_id
        where
          org_active_users.event_at = org_applies.event_at
          and org_active_users.organization_id = org_applies.organization_id
          and org_active_users.organization_id = subscriptions.organization_id
          and subscriptions.start_at <= org_active_users.event_at and (org_active_users.event_at <= subscriptions.end_at OR subscriptions.end_at is null)
          and org_active_users.organization_id = org_created_organization.organization_id
          and (email_domain <> 'hashicorp.com' or email_domain is null)
      )

      select * from org_activity
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum {
    type: sum
    drill_fields: [applies, active_users]
  }

  measure: percentile80 {
    type:  percentile
    percentile: 80
    drill_fields: [applies, active_users]
  }

  measure: distinct_orgs {
    type: count_distinct
    sql: ${organization_id} ;;
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

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: applies {
    type: number
    sql: ${TABLE}.applies ;;
  }

  dimension: active_users {
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension_group: current_time {
    type: time
    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]
    sql: CURRENT_TIMESTAMP::TIMESTAMP ;;
  }

  set: detail {
    fields: [
      event_at_time,
      organization_id,
      org_cohort,
      plan,
      applies,
      active_users
    ]
  }
}
