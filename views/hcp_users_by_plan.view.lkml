view: hcp_users_by_plan {
  sql_table_name: cloud_gtm.hcp_users_by_plan ;;

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: subscription_plan {
    type: string
    sql: ${TABLE}.subscription_plan ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
