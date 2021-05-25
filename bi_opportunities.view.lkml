view: bi_opportunities {
  sql_table_name: bi.opportunities ;;
  drill_fields: [opportunity_id]

  dimension: opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: close_date {
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
    sql: ${TABLE}.close_date ;;
  }


  dimension_group: close_date_pst {
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
    sql: ${TABLE}.close_date_pst ;;
  }


  dimension: close_quarter {
    type: string
    sql: ${TABLE}.close_quarter ;;
  }

  dimension_group: created_date {
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

  dimension_group: created_date_pst {
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
    sql: ${TABLE}.created_date_pst ;;
  }

  dimension: created_quarter {
    type: string
    sql: ${TABLE}.created_quarter ;;
  }

  dimension: current_acv {
    type: number
    sql: ${TABLE}.current_acv_c ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: is_sqo {
    type: yesno
    sql: ${TABLE}.is_sqo ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_bucket {
    type: string
    sql: ${TABLE}.lead_source_bucket_c ;;
  }

  dimension: mktg_contrib {
    type: number
    sql: ${TABLE}.mktg_contrib ;;
  }

  dimension: new_acv {
    type: number
    sql: ${TABLE}.new_acv_c ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.opportunity_name ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  dimension: owner_geo {
    type: string
    sql: ${TABLE}.owner_geo ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_segment {
    type: string
    sql: ${TABLE}.owner_segment ;;
  }

  dimension: owner_theater {
    type: string
    sql: ${TABLE}.owner_theater ;;
  }

  dimension: renewal_acv {
    type: number
    sql: ${TABLE}.renewal_acv_c ;;
  }

  dimension: sales_play {
    type: string
    sql: ${TABLE}.sales_play ;;
  }

  dimension: services_amount {
    type: number
    sql: ${TABLE}.services_amount_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_id, account_name, stage_name, opportunity_name]
  }
}
