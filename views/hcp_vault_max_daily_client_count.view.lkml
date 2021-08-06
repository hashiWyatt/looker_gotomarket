view: hcp_vault_max_daily_client_count {
  sql_table_name: cloud_gtm.hcp_vault_max_daily_client_count ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: max_daily_client_count {
    type: number
    sql: ${TABLE}.max_daily_client_count ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
