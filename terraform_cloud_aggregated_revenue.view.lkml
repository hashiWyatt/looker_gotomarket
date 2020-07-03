view: terraform_cloud_aggregated_revenue {
  derived_table: {
    sql:
      with
      salesforce_bookings as (
        select distinct
          opportunity_id,
          accounts.name,
          opportunities.type,
          opportunities.y_1_acv_c::decimal(14,2) as acv,
          (subscription_start_date_c)::date as start_at,
          (subscription_start_date_c + '365 days'::interval)::date as end_at
          from salesforce.opportunity_product, salesforce.products, salesforce.opportunities, salesforce.accounts
        where
          products.name like 'Terraform Cloud %'
          and opportunity_product.product_2_id = products.id
          and opportunity_product.opportunity_id = opportunities.id
          and opportunities.account_id = accounts.id
          and is_won
      ),
      stripe_charges as (
        select * from
        (select
            period_start as start_at,
            period_end as end_at,
            total::decimal(20,2)/100 as total_dollars
          from
            tf_cloud_stripe.invoices
          where paid
        )
        union all
        (select
            current_period_start as start_at,
            current_period_end as end_at,
            (quantity::decimal(20,2) * amount::decimal(20,2))/100 as total_dollars
          from
            tf_cloud_stripe.subscriptions, tf_cloud_stripe.plans
          where
            subscriptions.plan_id = plans.id
            and current_period_start >= date_trunc('month', getdate())
        )
      ),
      intervals as (
        select distinct date_trunc('month', start_at)::date as month
        FROM stripe_charges
      ),
      aggregated_charges as (
        select
          month,
          sum(acv_dollars) as acv_dollars
        from
          (
            (select
              date_trunc('month', start_at) as month,
              sum(total_dollars)*12 as acv_dollars
            from
              stripe_charges
            group by 1)
            union all
            (select
              month,
              sum(acv) as acv_dollars
            from intervals, salesforce_bookings
            where intervals.month >= start_at and intervals.month <= end_at
            group by 1)
          )
        group by month
      )

      select * from aggregated_charges
       ;;
  }
  dimension_group: current_time {
    type: time
    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]
    sql: CURRENT_TIMESTAMP::TIMESTAMP ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month ;;
  }

  dimension: acv_dollars {
    type: number
    sql: ${TABLE}.acv_dollars ;;
  }

  set: detail {
    fields: [month_time, acv_dollars]
  }
}
