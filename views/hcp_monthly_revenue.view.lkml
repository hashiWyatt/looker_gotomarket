view: hcp_monthly_revenue {
  sql_table_name: cloud_product_bi_data_mart.hcp_monthly_revenue ;;

  dimension: account_owner_email_c {
    label: "Account Owner"
    type: string
    sql: ${TABLE}.account_owner_email_c ;;
  }

  dimension: billed_amount {
    label: "Monthly Bill"
    type: number
    sql: ${TABLE}.billed_amount ;;
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

  dimension: geo_account_c {

    label: "Account Geo"
    type: string
    sql: ${TABLE}.geo_account_c ;;
  }

  dimension_group: month_ts {
    label: "Month"
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.month_ts ;;
  }

  dimension: name {
    label: "Account Name"
    type: string
    sql: ${TABLE}.name ;;
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
    label: "Account Region"
    type: string
    sql: ${TABLE}.region_account_c ;;
  }

  dimension: resource_id {
    type: string
    sql: ${TABLE}.resource_id ;;
  }

  dimension: segment_account_c {
    label: "Account Segment"
    type: string
    sql: ${TABLE}.segment_account_c ;;
  }

  dimension: theater_account_c {
    label: "Account Theater"
    type: string
    sql: ${TABLE}.theater_account_c ;;
  }

  dimension: cloud_organization_sfdc_id_c {
    label: "Cloud Organization SFDC Id"
    type:  string
    sql:  ${TABLE}.cloud_organization_sfdc_id_c ;;
  }

  dimension: expansion {
    label: "Expansion or Contraction"
    type: number
    sql:  ${TABLE}.expansion ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: sum {
    label: "Sum of Billing Amount"
    type: sum
    sql: ${billed_amount} ;;
    value_format_name: usd
  }

  measure: sum_expansion {
    label: "Sum of Expansion"
    type: sum
    sql: ${expansion} ;;
    value_format_name: usd
  }
}
