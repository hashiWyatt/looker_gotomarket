view: terraform_cloud_org_events_with_plan_daily {
  derived_table: {
    sql:
      SELECT
        entity_type,
        organization_id,
        entity_id,
        entity_cohort,
        email,
        email_domain,
        plan,
        event,
        event_text,
        date_trunc('day', event_at) as event_day,
        count(*) as events
      FROM ${terraform_cloud_user_org_events_with_plan.SQL_TABLE_NAME}
      GROUP BY
        entity_type,
        organization_id,
        entity_id,
        entity_cohort,
        email,
        email_domain,
        plan,
        event,
        event_text,
        date_trunc('day', event_at)
      ;;
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

  dimension: events {
    type: number
    sql:  ${TABLE}.events ;;
  }

  dimension_group: event_day {
    type: time
    sql: ${TABLE}.event_day ;;
  }

  measure: count {
    type:  count
    drill_fields: [detail*]
  }

  measure: total_events {
    type: sum
    sql: ${events} ;;
  }

  measure: mean_events {
    type:  average
    sql: ${events} ;;
  }

  measure: median_events {
    type: median
    sql: ${events} ;;
  }

  measure: p75_events {
    type: percentile
    percentile:  75
    sql:  ${events} ;;
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
      event_day_time
    ]
  }
}
