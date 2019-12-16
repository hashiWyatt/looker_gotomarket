view: g2k_first_oss_downloads_by_product {
  sql_table_name:  digital_performance.g2k_first_oss_downloads_by_product ;;

  dimension: company_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    type:  string
    sql: ${TABLE}.company_name;;
  }

  dimension: product {
    type:  string
    sql: ${TABLE}.product;;
  }

  dimension_group: download_timestamp {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.download_timestamp ;;
  }

  measure: company_count {
    type: count_distinct
    sql: ${TABLE}.company_id ;;
    drill_fields: [company_id]
  }
}
