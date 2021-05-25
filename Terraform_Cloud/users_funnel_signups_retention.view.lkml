view: tfc_users_funnel_signups_retention {
  derived_table: {
    sql: with
      signups as (
        select 'signups'::text as stage, count(distinct user_id) as users from ${tfc_users_signups.SQL_TABLE_NAME} where created_at > getdate() - '30 days'::interval
      ),
      active_30 as (
        select 'active'::text as stage, count(distinct user_id) as users from ${tfc_users_activity.SQL_TABLE_NAME} where new_signup = false and event_at > getdate() - '30 days'::interval
      ),
      active_prev as (
        select 'active'::text as stage, count(distinct user_id) as users from ${tfc_users_activity.SQL_TABLE_NAME}
        where new_signup = false and event_at > getdate() - '60 days'::interval and event_at <= getdate() - '30 days'::interval
      ),
      churned as (
        select 'churned' as stage, (b.users - a.users) as users from active_30 a, active_prev b where a.stage = b.stage
      )

      select stage, users from signups
      union
      select stage, users from active_30
      union
      select stage, users * -1 from churned
       ;;
  }

  measure: sum {
    type: sum
    sql: ${users};;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  set: detail {
    fields: [stage, users]
  }


}
