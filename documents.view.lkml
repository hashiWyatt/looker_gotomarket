view: documents {
  sql_table_name: salesforce.documents ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: author_id {
    type: string
    sql: ${TABLE}.author_id ;;
  }

  dimension: body_length {
    type: number
    sql: ${TABLE}.body_length ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
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

  dimension: is_body_searchable {
    type: yesno
    sql: ${TABLE}.is_body_searchable ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_internal_use_only {
    type: yesno
    sql: ${TABLE}.is_internal_use_only ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
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
    drill_fields: [id, developer_name, name]
  }
}
