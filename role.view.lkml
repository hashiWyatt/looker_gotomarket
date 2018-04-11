view: role {
  sql_table_name: salesforce.role ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: case_access_for_account_owner {
    type: string
    sql: ${TABLE}.case_access_for_account_owner ;;
  }

  dimension: contact_access_for_account_owner {
    type: string
    sql: ${TABLE}.contact_access_for_account_owner ;;
  }

  dimension: developer_name {
    type: string
    sql: ${TABLE}.developer_name ;;
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

  dimension: may_forecast_manager_share {
    type: yesno
    sql: ${TABLE}.may_forecast_manager_share ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_access_for_account_owner {
    type: string
    sql: ${TABLE}.opportunity_access_for_account_owner ;;
  }

  dimension: parent_role_id {
    type: string
    sql: ${TABLE}.parent_role_id ;;
  }

  dimension: portal_type {
    type: string
    sql: ${TABLE}.portal_type ;;
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

  dimension: rollup_description {
    type: string
    sql: ${TABLE}.rollup_description ;;
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
    drill_fields: [id, developer_name, name]
  }
}
