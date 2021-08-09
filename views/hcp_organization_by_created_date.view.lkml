view: hcp_organization_by_created_date {
  sql_table_name: cloud_product_bi_data_mart.hcp_organization_by_created_date ;;

  dimension: org_cluster_count_consul {
    type: number
    sql: ${TABLE}.org_cluster_count_consul ;;
  }

  dimension: org_cluster_count_vault {
    type: number
    sql: ${TABLE}.org_cluster_count_vault ;;
  }

  dimension_group: org_created {
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
    sql: ${TABLE}.org_created_date ;;
  }

  dimension: org_id {
    type: string
    sql: ${TABLE}.org_id ;;
  }

  dimension: org_membership_count {
    type: number
    sql: ${TABLE}.org_membership_count ;;
  }

  dimension: org_network_peering_count {
    type: number
    sql: ${TABLE}.org_network_peering_count ;;
  }

  dimension: total_org_cluster_count {
    type: number
    sql: ${TABLE}.total_org_cluster_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
