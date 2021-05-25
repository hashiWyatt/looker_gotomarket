view: stripe_retention {
  derived_table: {
    sql:
      with
      tfc_monthly_stripe_customers as (
        select distinct
          date_trunc('month', start_at) as month,
          organization_id
        from ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
        where organization_id is not null
      )
      select
        add_months(i.month, 1) as month,
        count(distinct i.organization_id) as initial,
        count(distinct r.organization_id) as retained
      from
        tfc_monthly_stripe_customers i
      left join tfc_monthly_stripe_customers r
      on i.organization_id = r.organization_id
      and add_months(i.month, 1) = r.month
      group by 1
       ;;
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

  measure: retained_perc {
    type: sum
    sql: CAST(${TABLE}.retained as FLOAT) / CAST(${TABLE}.initial as FLOAT) * 100;;
  }

  set: detail {
    fields: [month_time, initial, retained]
  }
}
