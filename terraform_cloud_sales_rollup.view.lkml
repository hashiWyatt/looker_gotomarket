view: terraform_cloud_sales_rollup {
  sql_table_name:  terraform_cloud.cloud_organization_sales_rollup ;;

  dimension: organization {
    type:  string
    sql: ${TABLE}.organization;;
  }

  dimension: status {
    type:  string
    sql: ${TABLE}.status ;;
  }

  dimension: domain {
    type:  string
    sql: ${TABLE}.domain ;;
  }

  dimension: organization_creator {
    type:  string
    sql: ${TABLE}.organization_creator ;;
  }

  dimension:  total_members {
    type: number
    sql: total_members ;;
  }

  measure: organization_count {
    type: count
    drill_fields: [organization]
  }
}
