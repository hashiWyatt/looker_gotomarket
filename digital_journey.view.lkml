view: digital_journey {
    sql_table_name:  digital_performance.digital_journey ;;

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

  dimension: phase {
    type: string
    sql: ${TABLE}.phase ;;
  }

  dimension_group: sent_at {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sent_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
