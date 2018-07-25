view: opportunities_created_g2000 {
  derived_table: {
    sql: SELECT COUNT(o.id) as count,
       date_trunc('month', o.created_date) as month
FROM "salesforce"."opportunities" as o
INNER JOIN salesforce.accounts as a ON (a.id = o.account_id)
INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (a.website = g.domain)
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
