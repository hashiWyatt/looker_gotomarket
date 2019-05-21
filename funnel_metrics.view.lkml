view: funnel_metrics {
  sql_table_name: salesforce.monthly_funnel_metrics;;

  dimension: month {
    type: date_month
    sql: ${TABLE}.monthyear ;;
  }

  measure: unique_visitors {
    type:  max
    sql: ${TABLE}.unique_visitors ;;
  }


  measure: known_names {
    type:  max
    sql: ${TABLE}.known_names ;;
  }

  measure: mql {
    type:  max
    sql: ${TABLE}.num_mql ;;
  }

  measure: sal {
    type:  max
    sql: ${TABLE}.num_sal ;;
  }

  measure: sal_plus_working_sal {
    type:  max
    sql: ${TABLE}.num_sal_plus_working ;;
  }

  measure: sqo {
    type:  max
    sql: ${TABLE}.num_sqo ;;
  }

  measure: cwo {
    type:  max
    sql: ${TABLE}.num_cwo ;;
  }

  measure: unqualified {
    type:  max
    sql: ${TABLE}.num_unqualified ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: funnel_metrics {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }