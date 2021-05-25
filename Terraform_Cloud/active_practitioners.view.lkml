view: terraform_cloud_active_practitioners_2 {
  derived_table: {
    sql:
      select * from ${terraform_cloud_active_users.SQL_TABLE_NAME}
      where plan in ('Free', 'Trial', 'Self-serve Preview', 'Limited User Preview') or plan is null
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

  dimension: applies {
    type: number
    sql: ${TABLE}.applies ;;
  }

  set: detail {
    fields: [
      event_at_time,
      organization_id,
      org_cohort,
      user_id,
      user_cohort,
      plan,
      applies
    ]
  }
}
