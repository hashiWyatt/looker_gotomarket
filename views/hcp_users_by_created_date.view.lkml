view: hcp_users_by_created_date {
  sql_table_name: cloud_product_bi_data_mart.hcp_users_by_created_date ;;


  dimension: active_product_interest {
    type: string
    sql: ${TABLE}.active_product_interest ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: implied_product_interest {
    type: string
    sql: ${TABLE}.implied_product_interest ;;
  }

  dimension: initial_product_interest {
    type: string
    sql: ${TABLE}.initial_product_interest ;;
  }

  dimension: org_cluster_count_consul {
    type: number
    sql: ${TABLE}.org_cluster_count_consul ;;
  }

  dimension: org_cluster_count_vault {
    type: number
    sql: ${TABLE}.org_cluster_count_vault ;;
  }

  dimension: org_owner_status {
    type: string
    sql: ${TABLE}.org_owner_status ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: total_org_cluster_count {
    type: number
    sql: ${TABLE}.total_org_cluster_count ;;
  }

  dimension_group: user_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.user_created_date ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: utm_capture {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.utm_capture_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
