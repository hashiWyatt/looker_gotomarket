view: hcp_organizations_billable_usage {
  sql_table_name: cloud_product_bi_data_mart.hcp_organizations_billable_usage ;;

  dimension: account_owner_email_c {
    type: string
    sql: ${TABLE}.account_owner_email_c ;;
  }

  dimension: account_usage_id {
    type: string
    sql: ${TABLE}.account_usage_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: billing_account_internal_id {
    type: string
    sql: ${TABLE}.billing_account_internal_id ;;
  }

  dimension_group: billing_period_end {
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
    sql: ${TABLE}.billing_period_end ;;
  }

  dimension_group: billing_period_start {
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
    sql: ${TABLE}.billing_period_start ;;
  }

  dimension: diff_price {
    type: number
    sql: ${TABLE}.diff_price ;;
  }

  dimension: diff_quantity {
    type: number
    sql: ${TABLE}.diff_quantity ;;
  }

  dimension: geo_account_c {
    type: string
    sql: ${TABLE}.geo_account_c ;;
  }

  dimension: monthly_reset {
    type: yesno
    sql: ${TABLE}.monthly_reset ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: previous_total_price {
    type: number
    sql: ${TABLE}.previous_total_price ;;
  }

  dimension: previous_total_quantity {
    type: number
    sql: ${TABLE}.previous_total_quantity ;;
  }

  dimension: product_key {
    type: string
    sql: ${TABLE}.product_key ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: resource_internal_id {
    type: string
    sql: ${TABLE}.resource_internal_id ;;
  }

  dimension: segment_account_c {
    type: string
    sql: ${TABLE}.segment_account_c ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.sfdc_account_id ;;
  }

  dimension: sfdc_org_id {
    type: string
    sql: ${TABLE}.sfdc_org_id ;;
  }

  dimension: subscribed_product_id {
    type: string
    sql: ${TABLE}.subscribed_product_id ;;
  }

  dimension: theater_account_c {
    type: string
    sql: ${TABLE}.theater_account_c ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension_group: usage_end {
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
    sql: ${TABLE}.usage_end ;;
  }

  dimension_group: usage_start {
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
    sql: ${TABLE}.usage_start ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: amount_sum {
    type: sum
    drill_fields: [diff_price]
  }

  measure: quantity_sum {
    type: sum
    drill_fields: [diff_quantity]
  }
}
