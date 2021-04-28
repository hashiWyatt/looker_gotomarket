view: terraform_cloud_active_practitioners_retention {
  derived_table: {
    sql:

    SELECT
        previous.*,
        current.user_id as retained_user_id
      FROM ${terraform_cloud_active_practitioners.SQL_TABLE_NAME} previous
      left join ${terraform_cloud_active_practitioners.SQL_TABLE_NAME} current
      on previous.user_id = current.user_id and
      date_trunc('month', previous.event_at) = date_trunc('month', current.event_at - '2 days'::interval)
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

  measure: churned_practitioners {
    type: number
    sql:  ${distinct_practitioners} - ${distinct_retained_practitioners} ;;
  }

  measure: distinct_orgs {
    type: count_distinct
    sql: ${organization_id} ;;
  }
  measure: distinct_retained_practitioners {
    type: count_distinct
    sql: ${retained_user_id} ;;
  }

  measure: distinct_practitioners {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: distinct_org {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
  }
  dimension: retained_user_id {
    type: string
    sql: ${TABLE}.retained_user_id ;;
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
