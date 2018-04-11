view: dashboards {
  sql_table_name: salesforce.dashboards ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: background_direction {
    type: string
    sql: ${TABLE}.background_direction ;;
  }

  dimension: background_end {
    type: number
    sql: ${TABLE}.background_end ;;
  }

  dimension: background_start {
    type: number
    sql: ${TABLE}.background_start ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: developer_name {
    type: string
    sql: ${TABLE}.developer_name ;;
  }

  dimension: folder_id {
    type: string
    sql: ${TABLE}.folder_id ;;
  }

  dimension: folder_name {
    type: string
    sql: ${TABLE}.folder_name ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: left_size {
    type: string
    sql: ${TABLE}.left_size ;;
  }

  dimension: middle_size {
    type: string
    sql: ${TABLE}.middle_size ;;
  }

  dimension: namespace_prefix {
    type: string
    sql: ${TABLE}.namespace_prefix ;;
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

  dimension: right_size {
    type: string
    sql: ${TABLE}.right_size ;;
  }

  dimension: running_user_id {
    type: string
    sql: ${TABLE}.running_user_id ;;
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

  dimension: text_color {
    type: number
    sql: ${TABLE}.text_color ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title_color {
    type: number
    sql: ${TABLE}.title_color ;;
  }

  dimension: title_size {
    type: number
    sql: ${TABLE}.title_size ;;
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
    drill_fields: [id, folder_name, developer_name]
  }
}
