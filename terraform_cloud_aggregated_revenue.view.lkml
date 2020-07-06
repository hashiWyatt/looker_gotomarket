view: terraform_cloud_aggregated_revenue {
  derived_table: {
    sql:
      with
      salesforce_bookings as (
        select * from ${terraform_cloud_salesforce_bookings.SQL_TABLE_NAME}
      ),
      stripe_charges as (
        select * from
        ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
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
