view: meta_redshift_monthly_bill_text {
  derived_table: {
    sql: SELECT
        billing_by_month.bill  AS "billing_by_month.bill",
        extract('month' from billing_by_month.month)  AS "billing_by_month.month_int",
        CASE
          WHEN extract('month' from billing_by_month.month) = 1 THEN 'January'
          WHEN extract('month' from billing_by_month.month) = 2 THEN 'February'
          WHEN extract('month' from billing_by_month.month) = 3 THEN 'March'
          WHEN extract('month' from billing_by_month.month) = 4 THEN 'April'
          WHEN extract('month' from billing_by_month.month) = 5 THEN 'May'
          WHEN extract('month' from billing_by_month.month) = 6 THEN 'June'
          WHEN extract('month' from billing_by_month.month) = 7 THEN 'July'
          WHEN extract('month' from billing_by_month.month) = 8 THEN 'August'
          WHEN extract('month' from billing_by_month.month) = 9 THEN 'September'
          WHEN extract('month' from billing_by_month.month) = 10 THEN 'October'
          WHEN extract('month' from billing_by_month.month) = 11 THEN 'November'
          ELSE 'Decemnber'
        END as "billing_by_month.month_text"
      FROM public.billing_by_month  AS billing_by_month
      ORDER BY "billing_by_month.month_int"

      --ORDER BY 1
      --LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: billing_by_month_bill {
    type: number
    sql: ${TABLE}."billing_by_month.bill" ;;
  }

  dimension: billing_by_month_month_int {
    type: number
    sql: ${TABLE}."billing_by_month.month_int" ;;
  }

  dimension: billing_by_month_month_text {
    type: string
    sql: ${TABLE}."billing_by_month.month_text" ;;
  }

  set: detail {
    fields: [billing_by_month_bill, billing_by_month_month_int, billing_by_month_month_text]
  }
}
