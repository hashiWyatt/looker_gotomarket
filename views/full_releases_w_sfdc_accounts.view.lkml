view: full_releases_w_sfdc_accounts {
  label: "OSS Downloads (With SFDC Accounts)"
  sql_table_name: releases_etl_reporting.full_releases_w_sfdc_accounts ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_is_g2k {
    type: yesno
    sql: ${TABLE}.account_is_g2k ;;
  }

  dimension: account_is_h2k {
    type: yesno
    sql: ${TABLE}.account_is_h2k ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: core_product {
    type: string
    sql: ${TABLE}.core_product ;;
  }

  dimension_group: download_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.download_date ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: global_2000_rank_c {
    type: number
    sql: ${TABLE}.global_2000_rank_c ;;
  }

  dimension: is_clearbit_matched {
    type: yesno
    sql: ${TABLE}.is_clearbit_matched ;;
  }

  dimension: is_customer_as_of_20210629 {
    type: yesno
    sql: ${TABLE}.is_customer_as_of_20210629 ;;
  }

  dimension: is_matched_to_sfdc_account {
    type: yesno
    sql: ${TABLE}.is_matched_to_sfdc_account ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
