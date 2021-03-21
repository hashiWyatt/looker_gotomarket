view: paid_tier_sfdc_matches {
  sql_table_name: terraform_cloud_hackathon.paid_tier_sfdc_matches ;;

  dimension: alexa_global_rank {
    type: number
    sql: ${TABLE}.alexa_global_rank ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: estimated_annual_revenue {
    type: string
    sql: ${TABLE}.estimated_annual_revenue ;;
  }

  dimension: has_sfdc_account {
    type: yesno
    sql: ${TABLE}.has_sfdc_account ;;
  }

  dimension_group: invoice_period_end {
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
    sql: ${TABLE}.invoice_period_end ;;
  }

  dimension_group: most_recent_apply {
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
    sql: ${TABLE}.most_recent_apply ;;
  }

  dimension: subscription_cost {
    type: number
    sql: ${TABLE}.subscription_cost ;;
  }

  dimension: total_applies {
    type: number
    sql: ${TABLE}.total_applies ;;
  }

  dimension: total_runs {
    type: number
    sql: ${TABLE}.total_runs ;;
  }

  dimension: total_users {
    type: number
    sql: ${TABLE}.total_users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
