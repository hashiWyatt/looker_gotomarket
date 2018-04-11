view: opportunity_history {
  sql_table_name: salesforce.opportunity_history ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension_group: close {
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
    sql: ${TABLE}.close_date ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: expected_revenue {
    type: string
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: probability {
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [id, stage_name]
  }
}
