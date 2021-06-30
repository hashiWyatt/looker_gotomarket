view: digital_cloud_site_users {

  sql_table_name:  digital_performance.cloud_site_users ;;

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

  measure: unique_users {
    type: sum
    sql: ${TABLE}.unique_users;;
    drill_fields: [unique_users]
  }
}
