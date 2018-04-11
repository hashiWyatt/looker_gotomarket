view: period {
  sql_table_name: salesforce.period ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: fiscal_year_settings_id {
    type: string
    sql: ${TABLE}.fiscal_year_settings_id ;;
  }

  dimension: fully_qualified_label {
    type: string
    sql: ${TABLE}.fully_qualified_label ;;
  }

  dimension: is_forecast_period {
    type: yesno
    sql: ${TABLE}.is_forecast_period ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
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

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    drill_fields: [id]
  }
}
