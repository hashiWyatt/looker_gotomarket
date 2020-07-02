view: hashiconf_digital_platform_livestream_views {

  sql_table_name:  hashiconf_digital_platform.livestream_views ;;

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

  dimension: path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
