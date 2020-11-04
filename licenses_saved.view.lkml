view: licenses_saved {
  sql_table_name: releases_etl_reporting.licenses_saved ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _id {
    type: string
    sql: ${TABLE}._id ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.account_owner ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: expiration_time {
    type: string
    sql: ${TABLE}.expiration_time ;;
  }

  dimension: flags {
    type: string
    sql: ${TABLE}.flags ;;
  }

  dimension: flags_modules {
    type: string
    sql: ${TABLE}.flags_modules ;;
  }

  dimension: flags_package {
    type: string
    sql: ${TABLE}.flags_package ;;
  }

  dimension: flags_total_performance_standbys {
    type: number
    sql: ${TABLE}.flags_total_performance_standbys ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: issue_time {
    type: string
    sql: ${TABLE}.issue_time ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opp {
    type: string
    sql: ${TABLE}.opp ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}.opportunity ;;
  }

  dimension_group: original_timestamp {
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
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: programmatic {
    type: yesno
    sql: ${TABLE}.programmatic ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: termination_time {
    type: string
    sql: ${TABLE}.termination_time ;;
  }

  dimension: theater {
    type: string
    sql: ${TABLE}.theater ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, context_library_name]
  }

  measure: count_unique_accounts {
    type: count_distinct
    sql: ${account} ;;
  }
}
