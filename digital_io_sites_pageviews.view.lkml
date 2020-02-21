view: digital_io_sites_pageviews {
  sql_table_name:  digital_performance.io_sites_pageviews ;;

  dimension: site {
    type:  string
    sql: ${TABLE}.site;;
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

  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews;;
    drill_fields: [pageviews]
  }
}
