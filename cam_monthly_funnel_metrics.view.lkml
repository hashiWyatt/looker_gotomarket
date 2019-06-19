view: cam_monthly_funnel_metrics {
  sql_table_name: salesforce.cam_monthly_funnel_metrics;;

  dimension: month {
    type: date_month
    sql: ${TABLE}.month ;;
  }

  measure: known_names {
    type:  max
    sql: ${TABLE}.num_known_names ;;
  }

  measure: mql {
    type:  max
    sql: ${TABLE}.num_mql ;;
  }

  measure: sal {
    type:  max
    sql: ${TABLE}.num_sal ;;
  }

  measure: sqo {
    type:  max
    sql: ${TABLE}.num_sqo ;;
  }

  measure: cwo {
    type:  max
    sql: ${TABLE}.num_cwo ;;
  }

  measure: unqualified {
    type:  max
    sql: ${TABLE}.num_unqualified ;;
  }

  measure: pipeline_sum {
    type:  max
    sql: ${TABLE}.pipeline_sum ;;
    value_format_name: usd
  }

  measure: pipeline_cam_amt {
    type:  max
    sql: ${TABLE}.pipeline_cam_amt ;;
    value_format_name: usd
  }

  measure: pipeline_eam_amt {
    type:  max
    sql: ${TABLE}.pipeline_eam_amt ;;
    value_format_name: usd
  }

  measure: num_cwo_by_cam {
    type:  max
    sql: ${TABLE}.num_cwo_by_cam ;;
  }

  measure: num_cwo_by_eam {
    type:  max
    sql: ${TABLE}.num_cwo_by_eam ;;
  }
}
