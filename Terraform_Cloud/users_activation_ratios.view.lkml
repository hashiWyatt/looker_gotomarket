view: tfc_users_activation_ratios {
  derived_table: {
    sql: with
      signups as (
        select original_timestamp as created_at, user_id
        from terraform_cloud.create_account
        where original_timestamp > getdate() - '120 days'::interval
      ),
      activated as (
        select
          date_trunc('day', s.created_at) as created_at,
          count(distinct s.user_id) as activated_users
        from signups s
        inner join ${tfc_events_show_workspace_with_recent_changes.SQL_TABLE_NAME} sw
        on s.user_id = sw.user_id
        and sw.event_at < s.created_at + '30 days'::interval
        where sw.event_at > getdate() - '120 days'::interval
        group by date_trunc('day', s.created_at)
      ),
      daily_signups as (
        select
          date_trunc('day', created_at) as created_at,
          count(distinct user_id) as users
        from signups
        group by 1
      ),
      user_activation_ratios as (
        select
          s.created_at,
          s.users,
          a.activated_users
        from daily_signups s
        left join activated a
        on s.created_at = a.created_at
      )

      select
        created_at,
        users,
        activated_users,
        users - activated_users as non_activated_users
      from user_activation_ratios
       ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  measure: users {
    type: average
    sql: ${TABLE}.users ;;
  }

  measure: activated_users {
    type: average
    sql: ${TABLE}.activated_users ;;
  }

  measure: non_activated_users {
    type: average
    sql: ${TABLE}.non_activated_users ;;
  }

  set: detail {
    fields: [created_at_time]
  }
}
