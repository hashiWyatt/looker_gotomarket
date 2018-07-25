view: customers_created_g2000 {
  derived_table: {
    sql: SELECT COUNT(a.id) as count,
       date_trunc('month',a.created_date) as month
FROM salesforce.accounts as a
INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (a.website = g.domain)
WHERE a.type = 'Customer'
GROUP BY month
 ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [count, month_time]
  }
}
