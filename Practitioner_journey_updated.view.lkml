view: practitioner_journey_updated {
  sql_table_name: bi_stage.practitioner_journey_updated ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.month ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: phase {
    type: string
    sql: ${TABLE}.phase ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: theater {
    type: string
    sql: ${TABLE}.theater ;;
  }

  measure: count {
    type: count
    drill_fields: [count]
  }
}
