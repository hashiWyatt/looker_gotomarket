view: users_rolling_signups_retention {
  derived_table: {
    sql: with signups as (
        select original_timestamp as created_at, user_id from terraform_cloud.create_account
      ),
      activity as (
        select distinct date_trunc('day', original_timestamp) as event_at, user_id from terraform_cloud.tracks
      ),
      daily_signups as (
        select
          date_trunc('day', created_at) as created_at,
          count(*) as users
        from signups
        group by date_trunc('day', created_at)
      ),
      monthly_signups as (
        select
          a.created_at,
          sum(b.users) as users
        from daily_signups a, daily_signups b
        where
          a.created_at >= b.created_at
          and b.created_at > (a.created_at - '30 days'::interval)
        group by a.created_at
      ),
      retained_activity as (
        select a.*
        from activity a
        inner join signups s
        on a.user_id = s.user_id and a.event_at > (s.created_at + '30 days'::interval)
      )


      select
        d.created_at,
        d.users as users_signups_1day,
        m.users as users_signups_30day,
        count(distinct user_id) as users_active_30day
      from daily_signups d
      inner join monthly_signups m
      on d.created_at = m.created_at
      left join retained_activity ra
      on ra.event_at <= d.created_at and ra.event_at > (d.created_at - '30 days'::interval)
      group by 1, 2, 3
      order by d.created_at
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: users_signups_1day {
    type: number
    sql: ${TABLE}.users_signups_1day ;;
  }

  dimension: users_signups_30day {
    type: number
    sql: ${TABLE}.users_signups_30day ;;
  }

  dimension: users_active_30day {
    type: number
    sql: ${TABLE}.users_active_30day ;;
  }

  set: detail {
    fields: [created_at_time, users_signups_1day, users_signups_30day, users_active_30day]
  }
}
