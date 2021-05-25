view: tfc_organizations_active {
  derived_table: {
    sql:
    with
      daily_events as (
        select
              distinct date_trunc('day', event_at) as event_at,
              organization_id,
              user_id
            from ${tfc_organizations_events.SQL_TABLE_NAME}
            where event_at > getdate() - '30 days'::interval
      )
      select
        de.event_at,
        de.organization_id,
        count(distinct prev_7.user_id) as active_users_7days,
        count(distinct prev_30.user_id) as active_users_30days
      from daily_events de
      left join daily_events prev_7
      on de.organization_id = prev_7.organization_id
      and prev_7.event_at between (de.event_at - '7 days'::interval) and de.event_at
      left join daily_events prev_30
      on de.organization_id = prev_30.organization_id
      and prev_30.event_at between (de.event_at - '30 days'::interval) and de.event_at
      group by 1, 2
      ;;
  }

  measure: active_users_7_days {
    type: average
    sql: ${TABLE}.active_users_7days ;;
  }

  measure: active_users_30_days {
    type: average
    sql: ${TABLE}.active_users_30days ;;
  }


  measure: distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
  }

  dimension: org_active_users_7_days {
    type: number
    sql: ${TABLE}.active_users_7days ;;
  }

  dimension: org_active_users_30_days {
    type: number
    sql: ${TABLE}.active_users_30days ;;
  }


  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      event_at_time,
      organization_id,
    ]
  }
}
