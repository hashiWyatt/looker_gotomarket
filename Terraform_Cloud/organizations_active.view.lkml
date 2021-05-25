view: tfc_organizations_active {
  derived_table: {
    sql: select event_at, event, organization_id from ${tfc_organizations_events.SQL_TABLE_NAME}
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      event_at_time,
      organization_id,
      event
    ]
  }
}
