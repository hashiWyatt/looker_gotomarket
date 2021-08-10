view: hcp_contracts {
  sql_table_name: cloud_gtm.hcp_contracts ;;

  dimension: acv_monthly {
    type: number
    value_format:"$#.00;($#.00)"
    sql: ${TABLE}.acv_monthly ;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension_group: date_added_in_hcp {
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
    sql: ${TABLE}.date_added_in_hcp ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: y_1_acv {
    type: number
    value_format:"$#.00;($#.00)"
    sql: ${TABLE}.y_1_acv ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
