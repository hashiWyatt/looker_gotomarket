view: terraform_cloud_active_users_rolling30 {
  derived_table: {
    sql: with days as (
              select distinct date_trunc('day', event_at) as day from ${terraform_cloud_active_users.SQL_TABLE_NAME}
            )

            select
              days.day,
              count(distinct user_id) as events
            from days, ${terraform_cloud_active_users.SQL_TABLE_NAME}
            where
              date_trunc('day', event_at) <= day
              and date_trunc('day', event_at) >= day - '30 days'::interval
            group by 1 order by 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: day {
    type: time
    sql: ${TABLE}.day ;;
  }

  dimension: events {
    type: number
    sql: ${TABLE}.events ;;
  }

  set: detail {
    fields: [day_time, events]
  }
}
