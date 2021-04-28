view: hcs_users_marketo {
  sql_table_name: cloud_product_bi_data_mart.hcs_users_marketo ;;

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: hcs_on_azure_last_login_date__c {
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
    sql: ${TABLE}.hcs_on_azure_last_login_date__c ;;
  }

  dimension: hcs_on_azure_live_clusters__c {
    type: number
    sql: ${TABLE}.hcs_on_azure_live_clusters__c ;;
  }

  dimension: hcs_on_azure_logins__c {
    type: number
    sql: ${TABLE}.hcs_on_azure_logins__c ;;
  }

  dimension: hcs_on_azure_sign_up__c {
    type: yesno
    sql: ${TABLE}.hcs_on_azure_sign_up__c ;;
  }

  dimension_group: hcs_on_azure_sign_up_date__c {
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
    sql: ${TABLE}.hcs_on_azure_sign_up_date__c ;;
  }

  dimension: hcs_on_azure_total_clusters__c {
    type: number
    sql: ${TABLE}.hcs_on_azure_total_clusters__c ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
