view: hcp_revenue_stripe {
  sql_table_name: cloud_gtm.hcp_revenue_stripe ;;
  label: "HCP Monthly Stripe Revenue (Organization-Level)"
  measure: billed_amount {
    label: "Billed Revenue"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.billed_amount / 100.00;;
  }

  dimension_group: billed_month {
    type: time
    timeframes: [
     month,
     fiscal_quarter,
    year
    ]
    sql: ${TABLE}.billed_month ;;
  }

  measure: cash_revenue {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.cash_revenue / 100.00;;

  }

  measure: churn {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.churn / 100.00;;
  }

  measure: direct_sales_churn {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.direct_sales_churn / 100.00;;
  }

  measure: contraction {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.contraction / 100.00 ;;
  }

  measure: delinquent_bills {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.delinquent_bills/100.00;;
  }

  measure: discounts {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.discounts/100.00 ;;
  }

  measure: expansion {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.expansion/100.00 ;;
  }

  measure: net_revenue {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.net_revenue /100.00 ;;
  }

  measure: new_business {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.new_business/100.00 ;;
  }

  measure: reactivation {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.reactivation/100.00 ;;
  }

  measure: taxes {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.taxes/100.00 ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
