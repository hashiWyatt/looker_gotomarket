view: terraform_cloud_enterprise_saas_opportunity_overlap {
  sql_table_name:  terraform_cloud.enterprise_saas_opportunity_cloud_overlap ;;

  dimension: salesforce_account_id {
    type:  string
    sql: ${TABLE}.salesforce_account_id;;
  }

  dimension: salesforce_account_email_domain {
    type:  string
    sql: ${TABLE}.salesforce_account_email_domain;;
  }

  dimension: account_owner_territory {
    type:  string
    sql: ${TABLE}.account_owner_territory;;
  }

  dimension:  opportunity_amount {
    type: number
    sql: opportunity_amount ;;
  }

  dimension: opportunity_type {
    type:  string
    sql: ${TABLE}.opportunity_type;;
  }

  dimension: tf_cloud_organization_name {
    type:  string
    sql: ${TABLE}.tf_cloud_organization_name;;
  }

  dimension: tf_cloud_status {
    type:  string
    sql: ${TABLE}.tf_cloud_status;;
  }

  dimension: tf_cloud_account_domain {
    type:  string
    sql: ${TABLE}.tf_cloud_status;;
  }

  dimension: tf_cloud_organization_creator {
    type:  string
    sql: ${TABLE}.tf_cloud_organization_creator;;
  }

  measure: account_count {
    type: count_distinct
    drill_fields: [salesforce_account_id]
    sql: ${TABLE}.salesforce_account_id;;
    }
}
