view: hcp_consul_max_daily_count {
  sql_table_name: cloud_gtm.hcp_consul_max_daily_count ;;

  dimension: consul_cluster_uuid {
    type: string
    sql: ${TABLE}.consul_cluster_uuid ;;
  }

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

  dimension: max_daily_instance_count {
    type: number
    sql: ${TABLE}.max_daily_instance_count ;;
  }

  dimension: max_daily_service_count {
    type: number
    sql: ${TABLE}.max_daily_service_count ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
