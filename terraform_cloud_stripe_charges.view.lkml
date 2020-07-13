view: terraform_cloud_stripe_charges {
  derived_table: {
    sql: select * from
        ((select
            period_start as start_at,
            period_end as end_at,
            total::decimal(20,2)/100 as total_dollars,
            customer_id
          from
            tf_cloud_stripe.invoices
          where paid
        )
        union all
        (select
            current_period_start as start_at,
            current_period_end as end_at,
            (quantity::decimal(20,2) * amount::decimal(20,2))/100 as total_dollars,
            customer_id
          from
            tf_cloud_stripe.subscriptions, tf_cloud_stripe.plans
          where
            subscriptions.plan_id = plans.id
            and current_period_start >= date_trunc('month', getdate())
        ))
as stripe, ${reporting_all_day_intervals.SQL_TABLE_NAME} as reporting
where
stripe.start_at <= reporting.day and stripe.end_at >= reporting.day
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: total_dollars {
    type: number
    sql: ${TABLE}.total_dollars ;;
  }

  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }

  dimension_group: end_at {
    type: time
    sql: ${TABLE}.end_at ;;
  }

  dimension_group: reporting_day {
    type: time
    sql: ${TABLE}.day ;;
  }

  measure: sum_total_dollars {
    type: sum
    sql: ${total_dollars} ;;
  }
}
