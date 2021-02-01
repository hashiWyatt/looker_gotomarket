view: terraform_cloud_aggregated_revenue {
  derived_table: {
    sql:
      with
      salesforce_bookings as (
        select *, 'tfcb'::text as revenue_type from ${terraform_cloud_salesforce_bookings.SQL_TABLE_NAME}
      ),
      stripe_charges as (
        select *, 'self-serve'::text as revenue_type from ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
      ),
      aggregated_charges as (
        select
          day,
          revenue_type,
          sum(acv_dollars) as acv_dollars
        from
          (
            (select
              day,
              revenue_type,
              sum(total_dollars)*12 as acv_dollars
            from
              stripe_charges
            group by 1, 2)
            union all
            (select
              day,
              revenue_type,
              sum(acv) as acv_dollars
            from salesforce_bookings
            group by 1, 2)
          )
        group by day, revenue_type
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

  dimension_group: reporting_day {
    type: time
    sql: ${TABLE}.day ;;
  }

  dimension: revenue_type {
    type:  string
    sql:  ${TABLE}.revenue_type ;;
  }
  dimension: acv_dollars {
    type: number
    sql: ${TABLE}.acv_dollars ;;
  }

  measure: max_acv_dollars {
    type: max
    sql: ${TABLE}.acv_dollars ;;
  }

  set: detail {
    fields: [reporting_day_time, revenue_type, acv_dollars]
  }
}
