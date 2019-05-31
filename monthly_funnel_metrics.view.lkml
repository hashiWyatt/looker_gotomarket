view: monthly_funnel_metrics {
  sql_table_name: salesforce.monthly_funnel_metrics;;

  dimension: month {
    type: date_month
    sql: ${TABLE}.monthyear ;;
  }

  measure: unique_visitors {
    type:  max
    sql: ${TABLE}.unique_visitors ;;
  }


  measure: known_names {
    type:  max
    sql: ${TABLE}.known_names ;;
  }

  measure: mql {
    type:  max
    sql: ${TABLE}.num_mql ;;
  }

  measure: sal {
    type:  max
    sql: ${TABLE}.num_sal ;;
  }

  measure: sal_plus_working_sal {
    type:  max
    sql: ${TABLE}.num_sal_plus_working ;;
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
}