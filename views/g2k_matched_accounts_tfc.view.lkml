view: g2k_matched_accounts_tfc {
  sql_table_name: terraform_cloud_hackathon.g2k_matched_accounts_tfc ;;

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
