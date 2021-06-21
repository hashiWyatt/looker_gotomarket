view: tfc_salesforce_customer_acv_monthly {
  derived_table: {
    sql: with

      tfc_salesforce_customers_monthly as (
        select
          distinct
            date_trunc('month', day) as month,
            customer_id,
            max(acv) as acv
        from ${tfc_salesforce_bookings.SQL_TABLE_NAME}
        group by 1, 2
        order by customer_id, date_trunc('month', day)
      ),
      tfc_salesforce_net_new as (
        select
            month,
            customer_id,
            acv,
            lag(acv, 1) over (partition by customer_id order by month) as prev_acv,
            lead(acv, 1) over (partition by customer_id order by month) as next_acv
          from tfc_salesforce_customers_monthly order by customer_id, month
      )

      select
        month,
        customer_id,
        acv,
        prev_acv,
        case
          when prev_acv is null then true
          else false
        end as net_new,
        case
          when prev_acv is null then acv
        end as net_new_acv,
        case
          when prev_acv < acv then acv - prev_acv
        end as expansion_acv,
        case
          when prev_acv > acv then acv - prev_acv
        end as contraction_acv,
        case
          when next_acv is null and month = date_trunc('month', add_months(getdate(), -1)) then acv * -1
        end as churn_acv
      from tfc_salesforce_net_new
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

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  measure: acv {
    type: sum
    sql: ${TABLE}.acv ;;
  }

  measure: prev_acv {
    type: sum
    sql: ${TABLE}.prev_acv ;;
  }

  dimension: net_new {
    type: yesno
    sql: ${TABLE}.net_new ;;
  }

  measure: net_new_acv {
    type: sum
    sql: ${TABLE}.net_new_acv ;;
  }

  measure: expansion_acv {
    type: sum
    sql: ${TABLE}.expansion_acv ;;
  }

  measure: contraction_acv {
    type: sum
    sql: ${TABLE}.contraction_acv ;;
  }

  measure: retained_acv {
    type: sum
    sql: (coalesce(${TABLE}.acv,0)::float - coalesce(${TABLE}.expansion_acv,0)::float - coalesce(${TABLE}.net_new_acv,0)::float - coalesce(${TABLE}.contraction_acv,0)::float - coalesce(${TABLE}.churn_acv,0)::float)/3 ;;
  }

  measure: churn_acv {
    type: sum
    sql: ${TABLE}.churn_acv ;;
  }

  set: detail {
    fields: [
      month_time,
      customer_id,

      net_new,

    ]
  }
}
