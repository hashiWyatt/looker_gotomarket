view: terraform_cloud_utm_funnel {
  sql_table_name: terraform_cloud.utm_funnel ;;

  dimension: utm_source {
    primary_key: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension:visited_signup_page {
    type: number
    sql: ${TABLE}.visited_signup_page;;
  }

  dimension:clicked_signup {
    type: number
    sql: ${TABLE}.clicked_signup;;
  }

  dimension:created_accounts {
    type: number
    sql: ${TABLE}.created_accounts;;
  }
}
