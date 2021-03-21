view: s3_binary_sfdc {
  sql_table_name: releases_etl_reporting.s3_binary_sfdc ;;

  dimension: account_geo {
    type: string
    sql: ${TABLE}.account_geo ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_is_target {
    type: string
    sql: ${TABLE}.account_is_target ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.account_owner ;;
  }

  dimension: account_region {
    type: string
    sql: ${TABLE}.account_region ;;
  }

  dimension: account_segment {
    type: string
    sql: ${TABLE}.account_segment ;;
  }

  dimension: account_theater {
    type: string
    sql: ${TABLE}.account_theater ;;
  }

  dimension: arch {
    type: string
    sql: ${TABLE}.arch ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: iam {
    type: string
    sql: ${TABLE}.iam ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
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
    drill_fields: [account_name, filename]
  }
}
