view: monthly_m100 {
  sql_table_name: bi.monthly_m100 ;;

  dimension: channel_mqls {
    type: number
    sql: ${TABLE}.channel_mqls ;;
  }

  dimension: channel_pct {
    type: number
    sql: ${TABLE}.channel_pct ;;
  }

  dimension: learn_mau {
    type: number
    sql: ${TABLE}.learn_mau ;;
  }

  dimension: mktg_contrib {
    type: number
    sql: ${TABLE}.mktg_contrib ;;
  }

  dimension: mktg_contrib_pct {
    type: number
    sql: ${TABLE}.mktg_contrib_pct ;;
  }

  dimension: mqls {
    type: number
    sql: ${TABLE}.mqls ;;
  }

  dimension: names {
    type: number
    sql: ${TABLE}.names ;;
  }

  dimension_group: reporting_month {
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
    sql: ${TABLE}.reporting_month ;;
  }

  dimension: sqo_pct {
    type: number
    sql: ${TABLE}.sqo_pct ;;
  }

  dimension: sqos {
    type: number
    sql: ${TABLE}.sqos ;;
  }

  dimension: tfc_mau {
    type: number
    sql: ${TABLE}.tfc_mau ;;
  }

  dimension: total_leads_created {
    type: number
    sql: ${TABLE}.total_leads_created ;;
  }

  dimension: total_new_acv {
    type: number
    sql: ${TABLE}.total_new_acv ;;
  }

  dimension: total_opps_created {
    type: number
    sql: ${TABLE}.total_opps_created ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
