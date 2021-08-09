view: hcp_users_by_created_date {
  sql_table_name: cloud_product_bi_data_mart.hcp_users_by_created_date ;;

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: org_cluster_count_consul {
    type: number
    sql: ${TABLE}.org_cluster_count_consul ;;
  }

  dimension: org_cluster_count_vault {
    type: number
    sql: ${TABLE}.org_cluster_count_vault ;;
  }

  dimension: org_network_peering_count {
    type: number
    sql: ${TABLE}.org_network_peering_count ;;
  }

  dimension: org_owner_status {
    type: string
    sql: ${TABLE}.org_owner_status ;;
  }

  dimension: total_org_cluster_count {
    type: number
    sql: ${TABLE}.total_org_cluster_count ;;
  }

  dimension_group: user_created {
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
    sql: ${TABLE}.user_created_date ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
