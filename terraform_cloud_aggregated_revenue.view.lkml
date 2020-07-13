view: terraform_cloud_aggregated_revenue {
  derived_table: {
    sql:
      with
      salesforce_bookings as (
        select * from ${terraform_cloud_salesforce_bookings.SQL_TABLE_NAME}
      ),
      stripe_charges as (
        select * from ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
      ),
      aggregated_charges as (
        select
          day,
          sum(acv_dollars) as acv_dollars
        from
          (
            (select
              day,
              sum(total_dollars)*12 as acv_dollars
            from
              stripe_charges
            group by 1)
            union all
            (select
              day,
              sum(acv) as acv_dollars
            from salesforce_bookings
            group by 1)
          )
        group by day
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

  dimension: acv_dollars {
    type: number
    sql: ${TABLE}.acv_dollars ;;
  }

  set: detail {
    fields: [reporting_day_time, acv_dollars]
  }
}
