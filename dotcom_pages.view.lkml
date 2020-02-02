view: dotcom_pages {
  sql_table_name:  content_performance.dotcom_pages ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: path {
    type:  string
    sql: ${TABLE}.path;;
  }

  dimension: anonymous_id {
    type:  string
    sql: ${TABLE}.anonymous_id;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_unique {
    type: count_distinct
    drill_fields: [anonymous_id]
  }
}
