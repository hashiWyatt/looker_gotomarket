view: first_user_pageview {
  sql_table_name: hashiconf_digital_platform.first_user_pageview ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}.row_number ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
