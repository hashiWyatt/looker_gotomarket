view: digital_learn_site_users {

  sql_table_name:  digital_performance.learn_site_users ;;

  dimension: track {
    type:  string
    sql: ${TABLE}.track;;
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

  measure: unique_users {
    type: sum
    sql: ${TABLE}.unique_users;;
    drill_fields: [unique_users]
  }
}
