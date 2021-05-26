view: stripe_revenue_retention {
  derived_table: {
    sql: with

      tfc_stripe_monthly_customer_charges as (
        select
          date_trunc('month', start_at) as month,
          organization_id,
          max(total_dollars) as dollars
        from ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
        group by 1, 2
      ), tfcb_bookings as (
        select distinct
          date_trunc('month', start_at) as month,
          organization_id,
          acv/12 as dollars
        from ${tfc_salesforce_bookings.SQL_TABLE_NAME}
      )

      select
        add_months(i.month, 1) as month,
        sum(i.dollars) as initial,
        sum(coalesce(r.dollars, t.dollars)) as retained
      from
        tfc_stripe_monthly_customer_charges i
      left join tfc_stripe_monthly_customer_charges r
      on i.organization_id = r.organization_id
      and add_months(i.month, 1) = r.month
      left join tfcb_bookings t
      on i.organization_id = t.organization_id
      and add_months(i.month, 1) = t.month
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month ;;
  }

  measure: initial {
    type: sum
    sql: ${TABLE}.initial ;;
  }

  measure: retained {
    type: sum
    sql: ${TABLE}.retained ;;
  }

  measure: net_revenue_retention {
    type: sum
    sql: CAST(${TABLE}.retained as FLOAT) / CAST(${TABLE}.initial as FLOAT) * 100;;
  }


  set: detail {
    fields: [month_time, initial, retained]
  }
}
