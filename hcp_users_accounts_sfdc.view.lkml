view: hcp_users_accounts_sfdc {
  sql_table_name: cloud_product_bi_data_mart.hcp_users_accounts_sfdc ;;

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: hcp_organization_id {
    type: string
    sql: ${TABLE}.hcp_organization_id ;;
  }

  dimension: salesforce_account_geo {
    type: string
    sql: ${TABLE}.salesforce_account_geo ;;
  }

  dimension: salesforce_account_owner {
    type: string
    sql: ${TABLE}.salesforce_account_owner ;;
  }

  dimension: salesforce_account_region {
    type: string
    sql: ${TABLE}.salesforce_account_region ;;
  }

  dimension: salesforce_account_segment {
    type: string
    sql: ${TABLE}.salesforce_account_segment ;;
  }

  dimension: salesforce_account_theater {
    type: string
    sql: ${TABLE}.salesforce_account_theater ;;
  }

  dimension: sfdc_account {
    type: string
    sql: ${TABLE}.sfdc_account ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.sfdc_account_id ;;
  }

  dimension: vault_cluster_org_member {
    type: yesno
    sql: ${TABLE}.vault_cluster_org_member ;;
  }

  dimension: consul_cluster_org_member {
    type: yesno
    sql: ${TABLE}.consul_cluster_org_member ;;
  }

  dimension: has_any_opportunity {
    type: yesno
    sql: ${TABLE}.has_any_opportunity ;;
  }

  dimension: most_recent_opportunity_amount {
    type: number
    sql: ${TABLE}.most_recent_opportunity_amount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
