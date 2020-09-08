view: terraform_cloud_rolling_retention_cohort_events {
  derived_table: {
    sql:
      select * from ${terraform_cloud_user_org_events_with_plan.SQL_TABLE_NAME}
      where entity_id in (select distinct entity_id from ${terraform_cloud_user_org_events_with_plan.SQL_TABLE_NAME}
    where entity_cohort between (getdate() - '120 days'::interval) and (getdate() - '90 days'::interval))
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: average {
    type: average
    sql: ${count} ;;
  }
  measure: distinct_orgs {
    type:  count_distinct
    sql: ${organization_id} ;;
  }
  measure: distinct_entities {
    type:  count_distinct
    sql: ${entity_id} ;;
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

  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
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
      event_at_time
    ]
  }
}
