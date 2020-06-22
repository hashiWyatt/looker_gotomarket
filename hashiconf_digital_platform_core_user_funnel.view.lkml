view: hashiconf_digital_platform_core_user_funnel {
  sql_table_name:  hashiconf_digital_platform.core_user_funnel ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
