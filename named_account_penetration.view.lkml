view: named_account_penetration {
  sql_table_name: salesforce.named_account_penetration ;;

  dimension:  created_date {
    description: "Account Creation Date"
    type:  date
    sql: ${TABLE}.created_date   ;;
  }

  dimension: name {
    description: "Name of the account"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: region {
    description: "Region of the account"
    type: string
    sql: ${TABLE}.owner_territory_c ;;
  }

  dimension: geo {
    description: "Geo of account - either NA or INTL"
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: job_role {
    description: "Owner job role of account"
    type: string
    sql: ${TABLE}.owner_job_role_c ;;
  }

  dimension: account_tier {
    description: "Type of account - either Strategic or Enterprise"
    type: string
    sql: ${TABLE}.account_tier_c ;;
  }

  dimension: num_contacts {
    description: "Number of contacts associated with the account"
    type: number
    sql: ${TABLE}.num_contacts ;;
  }

  dimension: num_open_deals {
    description: "Number of open deals associated with the account"
    type: number
    sql: ${TABLE}.num_open_deals ;;
  }

  dimension: num_closed_won_deals {
    description: "Number of closed deals associated with the account"
    type: number
    sql: ${TABLE}.num_closed_won_deals ;;
  }


  dimension: status {
    description: "status of the account"
    type: string
    case: {
      when: {
        sql: ${TABLE}.status = 'inactive' ;;
        label: "inactive"
      }
      when: {
        sql: ${TABLE}.status = 'active' ;;
        label: "active"
      }
      when: {
        sql: ${TABLE}.status = 'oppty' ;;
        label: "oppty"
      }
      when: {
        sql: ${TABLE}.status = 'won' ;;
        label: "won"
      }
    }

  }
  measure: count_of_accounts {
    type:  count
    drill_fields: [status]
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

# view: strategic_account_penetration {
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
