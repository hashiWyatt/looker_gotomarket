view: opportunity_revenue_amounts {
  sql_table_name: salesforce.opportunity_revenue ;;

  dimension: id {
    type:  string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_date {
    type:  time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:  ${TABLE}.created_date ;;
  }

  dimension_group: close_date {
    type:  time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:  ${TABLE}.close_date ;;
  }

  dimension: opportunity_name {
    type:  string
    sql: ${TABLE}.name ;;
  }

  dimension: lead_product {
    type:  string
    sql: ${TABLE}.lead_product_c ;;
  }

  dimension: owner_territory {
    type:  string
    sql: ${TABLE}.owner_territory ;;
  }

  dimension: stage_name {
    type:  string
    sql: ${TABLE}.stage_name ;;
  }

  measure: sum_amount {
    type:  sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: min {
    type: min
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: 25th_percentile {
    type: percentile
    percentile:  25
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: median {
    type: median
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: 75th_percentile {
    type: percentile
    percentile:  75
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }


  measure: max {
    type: max
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }
}