view: reporting_all_day_intervals {
  derived_table: {
    sql: select distinct date_trunc('day', timestamp) as day from terraform_cloud.state_version_created
      ;;
  }
  dimension_group: day {
    type: time
    sql: ${TABLE}.day ;;
  }

  set: detail {
    fields: [day_time]
  }
}
