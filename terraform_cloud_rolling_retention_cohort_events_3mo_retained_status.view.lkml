view: terraform_cloud_rolling_retention_cohort_events_3mo_retained_status {
  derived_table: {
    sql:
      select
        events.*,
        case when retained_users.entity_id is not null then true else false end as retained_3mo
      from ${terraform_cloud_rolling_retention_cohort_events.SQL_TABLE_NAME} as events
      left join ${terraform_cloud_rolling_retention_cohort_retained_users.SQL_TABLE_NAME} as retained_users
      on events.entity_id = retained_users.entity_id
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_orgs {
    type:  count_distinct
    sql: ${organization_id} ;;
  }
  measure: distinct_entities {
    type:  count_distinct
    sql: ${TABLE}.entity_id ;;
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

  dimension: retained_3mo {
    type: yesno
    sql:  ${TABLE}.retained_3mo ;;
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
      event_at_time,
      retained_3mo
    ]
  }
}
