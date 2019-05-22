view: terraform_cloud_utm_funnel {
  sql_table_name: terraform_cloud.utm_funnel ;;

  dimension: utm_source {
    primary_key: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  measure:visited_signup_page {
    type: number
    sql: ${TABLE}.visited_signup_page;;
  }

  measure:clicked_signup {
    type: number
    sql: ${TABLE}.clicked_signup;;
  }

  measure:created_accounts {
    type: number
    sql: ${TABLE}.created_accounts;;
  }
}
