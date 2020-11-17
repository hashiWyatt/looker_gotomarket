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

  measure: count {
    type: count
    drill_fields: []
  }
}
