view: hcp_monthly_revenue {
  sql_table_name: cloud_product_bi_data_mart.hcp_monthly_revenue ;;
  label: "HCP Monthly Revenue (Cluster-Level)"
  dimension: account_owner_email_c {
    type: string
    sql: ${TABLE}.account_owner_email_c ;;
  }

  dimension: billed_amount {
    type: number
    sql: ${TABLE}.billed_amount ;;
  }

  dimension: cloud_organization_sfdc_id_c {
    type: string
    sql: ${TABLE}.cloud_organization_sfdc_id_c ;;
  }

  dimension_group: cluster_deleted {
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
    sql: ${TABLE}.cluster_deleted_time ;;
  }

  dimension: contraction {
    type: number
    sql: ${TABLE}.contraction ;;
  }

  dimension: expansion {
    type: number
    sql: ${TABLE}.expansion ;;
  }

  dimension: billing_account_internal_id {
    type:  string
    sql:  ${TABLE}.billing_account_internal_id ;;
  }

  dimension: account_type {
    type:  string
    sql:  ${TABLE}.account_type ;;
    label: "Billing Account Status"
  }

  dimension: geo_account_c {
    type: string
    sql: ${TABLE}.geo_account_c ;;
  }

  dimension: last_month_total {
    type: number
    sql: ${TABLE}.last_month_total ;;
  }

  dimension_group: month_ts {
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
    sql: ${TABLE}.month_ts ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: net {
    type: number
    sql: ${TABLE}.net ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: product_key {
    type: string
    sql: ${TABLE}.product_key ;;
  }

  dimension: recurring {
    type: yesno
    sql: ${TABLE}.recurring ;;
  }

  dimension: region_account_c {
    type: string
    sql: ${TABLE}.region_account_c ;;
  }

  dimension: resource_id {
    type: string
    sql: ${TABLE}.resource_id ;;
  }

  dimension: segment_account_c {
    type: string
    sql: ${TABLE}.segment_account_c ;;
  }

  dimension: theater_account_c {
    type: string
    sql: ${TABLE}.theater_account_c ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: sum {
    type: sum
    sql:  ${billed_amount} ;;
    value_format_name:usd
  }

  measure: sum_expansion{
    type:  sum
    sql: ${expansion} ;;
    value_format_name: usd
  }

  measure: sum_contraction{
    type:  sum
    sql: ${contraction} ;;
    value_format_name: usd
  }

  measure: sum_net{
    type:  sum
    sql: ${net} ;;
    value_format_name: usd
  }

}
