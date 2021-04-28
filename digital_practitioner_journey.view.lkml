view: digital_practitioner_journey {
  sql_table_name:  digital_journeys.practitioner_journey ;;

  dimension: product {
    type:  string
    sql: ${TABLE}.product;;
  }

  dimension: phase {
    type:  string
    sql: ${TABLE}.phase;;
  }

  dimension: page {
    type:  string
    sql: ${TABLE}.page;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year,
    ]
    sql: ${TABLE}.month ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count;;
    drill_fields: [count]
  }
}
