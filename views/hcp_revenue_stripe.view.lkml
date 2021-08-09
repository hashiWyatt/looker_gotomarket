view: hcp_revenue_stripe {
  sql_table_name: cloud_gtm.hcp_revenue_stripe ;;

  dimension: billed_amount {
    type: number
    sql: ${TABLE}.billed_amount ;;
  }

  dimension_group: billed_month {
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
    sql: ${TABLE}.billed_month ;;
  }

  dimension: cash_revenue {
    type: number
    sql: ${TABLE}.cash_revenue ;;
  }

  dimension: churn {
    type: number
    sql: ${TABLE}.churn ;;
  }

  dimension: contraction {
    type: number
    sql: ${TABLE}.contraction ;;
  }

  dimension: delinquent_bills {
    type: number
    sql: ${TABLE}.delinquent_bills ;;
  }

  dimension: discounts {
    type: number
    sql: ${TABLE}.discounts ;;
  }

  dimension: expansion {
    type: number
    sql: ${TABLE}.expansion ;;
  }

  dimension: net_revenue {
    type: number
    sql: ${TABLE}.net_revenue ;;
  }

  dimension: new_business {
    type: number
    sql: ${TABLE}.new_business ;;
  }

  dimension: reactivation {
    type: number
    sql: ${TABLE}.reactivation ;;
  }

  dimension: taxes {
    type: number
    sql: ${TABLE}.taxes ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
