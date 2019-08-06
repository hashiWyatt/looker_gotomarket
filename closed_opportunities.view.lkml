view: closed_opportunities {
  derived_table: {
    sql: SELECT
      close_date,
      users.name AS CAM_name,
      opportunities.name,
      y_1_acv_c,
      amount,
      stage_name
      FROM
      salesforce.opportunities
        LEFT JOIN
          salesforce.users
          ON opportunities.created_by_id = users.id
      WHERE (stage_name = 'Closed/Won' OR stage_name = 'Closed/Lost')
      AND close_date >= '2019-02-01'
      AND opportunities.is_deleted = False
      AND
        (
           users.name = 'Alex Ponce'
           OR users.name = 'Jeremy Truvillion'
           OR users.name = 'Nedim Mekanic'
           OR users.name = 'Samantha Lee'
        )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: close_date {
    type: time
    sql: ${TABLE}.close_date ;;
  }

  dimension: cam_name {
    type: string
    sql: ${TABLE}.cam_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: y_1_acv {
    type: number
    sql: ${TABLE}.y_1_acv_c ;;
    value_format: "#,##0.00"
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    value_format: "#,##0.00"
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  set: detail {
    fields: [
      close_date_time,
      cam_name,
      name,
      y_1_acv,
      amount,
      stage_name
    ]
  }
}
