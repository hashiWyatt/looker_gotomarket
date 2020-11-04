view: terraform_cloud_rolling_retention_feature_frequency_analysis {
  derived_table: {
    sql:
      select totals.*,
       first_month_frequency.frequency_30days,
        entity_details.email, entity_details.email_domain, entity_details.entity_cohort
      from (
        select
          events.entity_id,
          events.organization_id,
          events.event,
          events.retained_3mo,
          count(*) as frequency_total
          from ${terraform_cloud_rolling_retention_cohort_events_3mo_retained_status.SQL_TABLE_NAME} as events
          group by events.entity_id,
          events.organization_id,
          events.event,
          events.retained_3mo
      ) as totals
       left join (
         select entity_id, event, count(*) as frequency_30days
         from ${terraform_cloud_rolling_retention_cohort_events_3mo_retained_status.SQL_TABLE_NAME}
         where event_at between entity_cohort and (entity_cohort + '30 days'::interval)
         group by entity_id, event
       ) as first_month_frequency
       on totals.entity_id = first_month_frequency.entity_id and
       totals.event = first_month_frequency.event
      inner join (
        select distinct entity_id, email, email_domain, entity_cohort
        from ${terraform_cloud_rolling_retention_cohort_events_3mo_retained_status.SQL_TABLE_NAME}
      ) as entity_details
      on totals.entity_id = entity_details.entity_id
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

  dimension: retained_3mo {
    type: yesno
    sql:  ${TABLE}.retained_3mo ;;
  }

  dimension: frequency_30days {
    type:  number
    sql:  ${TABLE}.frequency_30days ;;
  }

  dimension: frequency_total {
    type:  number
    sql:  ${TABLE}.frequency_total ;;
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
      retained_3mo,
      frequency_30days,
      frequency_total
    ]
  }
}
