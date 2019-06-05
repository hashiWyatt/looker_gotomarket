view: terraform_cloud_utm_funnel {
  sql_table_name: terraform_cloud.utm_funnel ;;

  dimension: utm_source {
    primary_key: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  measure:visited_signup_page {
    type: max
    sql: ${TABLE}.visited_signup_page;;
  }

  measure:clicked_signup {
    type: max
    sql: ${TABLE}.clicked_signup;;
  }

  measure:created_accounts {
    type: max
    sql: ${TABLE}.created_accounts;;
  }
}
