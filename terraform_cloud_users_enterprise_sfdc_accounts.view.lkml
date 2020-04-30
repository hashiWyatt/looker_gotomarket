view: terraform_cloud_users_enterprise_sfdc_accounts {
  sql_table_name: terraform_cloud.users_enterprise_sfdc_accounts ;;

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: accountowner {
    type: string
    sql: ${TABLE}.accountowner ;;
  }

  dimension: accountowneremail {
    type: string
    sql: ${TABLE}.accountowneremail ;;
  }

  dimension: accountownertheater {
    type: string
    sql: ${TABLE}.accountownertheater ;;
  }

  dimension: accountownergeo {
    type: string
    sql: ${TABLE}.accountownergeo ;;
  }

  dimension: accountownersegment {
    type: string
    sql: ${TABLE}.accountownersegment ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_job_role_c {
    type: string
    sql: ${TABLE}.owner_job_role_c ;;
  }

  dimension: sfdc_email_domain {
    type: string
    sql: ${TABLE}.sfdc_email_domain ;;
  }

  dimension: tfc_email {
    type: string
    sql: ${TABLE}.tfc_email ;;
  }

  dimension: tfc_email_domain {
    type: string
    sql: ${TABLE}.tfc_email_domain ;;
  }

  dimension: tfc_plan {
    type: string
    sql: ${TABLE}.tfc_plan ;;
  }

  dimension: tfc_userid {
    type: string
    sql: ${TABLE}.tfc_userid ;;
  }

  dimension_group: tfc_account_created_date_group {
    type: time
    sql:  ${TABLE}.tfc_account_created_date ;;
}

  dimension: tfc_account_created_date {
    type:  date
    sql:  ${TABLE}.tfc_account_created_date ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
