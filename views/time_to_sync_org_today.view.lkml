view: time_to_sync_org_today {
  sql_table_name: terraform_cloud_hackathon.time_to_sync_org_today ;;

  dimension: time_to_sync {
    type: number
    sql: ${TABLE}.time_to_sync ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
