view: tfc_users_active {
  derived_table: {
    sql: select original_timestamp as event_at, event, user_id from terraform_cloud.tracks where user_id not in (select user_id from ${tfc_internal_users.SQL_TABLE_NAME})
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      event_at_time,
      user_id,
      event
    ]
  }
}
