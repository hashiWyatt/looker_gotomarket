view: terraform_cloud_active_orgs_retention {

  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        previous.*,
        current.organization_id as retained_organization_id
      FROM ${terraform_cloud_active_orgs.SQL_TABLE_NAME} previous
      left join ${terraform_cloud_active_orgs.SQL_TABLE_NAME} current
      on previous.organization_id = current.organization_id and
      date_trunc('week', previous.event_at) + '7 days'::interval = date_trunc('week', current.event_at)
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

  measure: churned_orgs {
    type: number
    sql:  ${distinct_orgs} - ${distinct_retained_orgs} ;;
  }

  measure: distinct_orgs {
    type: count_distinct
    sql: ${organization_id} ;;
  }
  measure: distinct_retained_orgs {
    type: count_distinct
    sql: ${retained_organization_id} ;;
  }
  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }
  dimension: retained_organization_id {
    type: string
    sql: ${TABLE}.retained_organization_id ;;
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
      retained_organization_id,
      org_cohort,
      plan,
      applies,
      active_users
    ]
  }
}
