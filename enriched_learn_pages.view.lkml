view: enriched_learn_pages {
  sql_table_name: digital_performance.enriched_learn_pages ;;

  dimension: id {
    type: string
    sql: ${TABLE}.pageview_id ;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  measure: downloads_count {
    type: count
  }
}
