view: opportunity_field_history {
  sql_table_name: salesforce.opportunity_field_history ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: new_value {
    type: string
    sql: ${TABLE}.new_value ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}.old_value ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
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
