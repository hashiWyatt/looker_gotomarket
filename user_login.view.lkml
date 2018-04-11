view: user_login {
  sql_table_name: salesforce.user_login ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: is_frozen {
    type: yesno
    sql: ${TABLE}.is_frozen ;;
  }

  dimension: is_password_locked {
    type: yesno
    sql: ${TABLE}.is_password_locked ;;
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

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.sender_name,
      users.name,
      users.username,
      users.last_name,
      users.community_nickname,
      users.company_name,
      users.first_name,
      users.id
    ]
  }
}
