view: tfc_users_signups {
  derived_table: {
    sql: select original_timestamp as created_at, user_id from terraform_cloud.create_account where user_id not in (select user_id from ${tfc_internal_users.SQL_TABLE_NAME})
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [created_at_time, user_id]
  }
}
