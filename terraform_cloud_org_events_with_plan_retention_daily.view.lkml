view: terraform_cloud_org_events_with_plan_retention_daily {
  derived_table: {
    sql:
      SELECT
        entity_type,
        current.organization_id,
        entity_id,
        entity_cohort,
        email,
        email_domain,
        plan,
        event,
        event_text,
        current.event_day,
        current.events,
        --next_day.events as next_day_event,
        --next_week.events as next_week_events,
        next_month.events as next_month_events
      FROM ${terraform_cloud_org_events_with_plan_daily.SQL_TABLE_NAME} as current
      --left join (
      --  select organization_id, event_day, count(*) as events FROM ${terraform_cloud_org_events_with_plan_daily.SQL_TABLE_NAME} group by 1, 2
      --) as next_day
      --on current.organization_id = next_day.organization_id and
      --  (current.event_day + '1 day'::interval) = next_day.event_day
      --left join (
      --  select organization_id, date_trunc('week', event_day) as event_week, count(*) as events FROM ${terraform_cloud_org_events_with_plan_daily.SQL_TABLE_NAME}
      --  where event_day > getdate() - '180 days'::interval group by 1, 2
      --) as next_week
      --on current.organization_id = next_week.organization_id and
      --  (date_trunc('week', current.event_day) + '7 day'::interval) = next_week.event_week
      left join (
        select organization_id, date_trunc('month', event_day) as event_month, count(*) as events FROM ${terraform_cloud_org_events_with_plan_daily.SQL_TABLE_NAME}
        where event_day > getdate() - '180 days'::interval group by 1, 2
      ) as next_month
      on current.organization_id = next_month.organization_id and
        date_trunc('month', (current.event_day + '31 day'::interval)) = next_month.event_month
      where current.event_day > getdate() - '180 days'::interval

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

  dimension: next_day_events {
    type: number
    sql:  ${TABLE}.next_day_events ;;
  }
  dimension: next_week_events {
    type: number
    sql:  ${TABLE}.next_week_events ;;
  }
  dimension: next_month_events {
    type: number
    sql:  ${TABLE}.next_month_events ;;
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
