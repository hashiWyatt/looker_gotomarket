view: fastly_metrics {
  sql_table_name: releases_etl.fastly_metrics ;;

  dimension: arch {
    type: string
    sql: ${TABLE}.arch ;;
  }

  dimension: download_source {
    type: string
    sql: ${TABLE}.download_source ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remote_ip ;;
  }

  dimension: serve_time_sec {
    type: number
    sql: ${TABLE}.serve_time_sec ;;
  }

  dimension: served_bytes {
    type: number
    sql: ${TABLE}.served_bytes ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ts ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: unique_ip {
    type: count_distinct
    sql: ${remote_ip} ;;
  }
}