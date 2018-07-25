view: opportunities_closedwon_g2000 {
  derived_table: {
    sql: SELECT COUNT(DISTINCT h.opportunity_id) as count,
       date_trunc('month', h.close_date) as month
FROM "salesforce"."opportunity_history" as h
INNER JOIN salesforce.opportunities as o ON (h.opportunity_id = o.id)
INNER JOIN salesforce.accounts as a ON (a.id = o.account_id)
INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (a.website = g.domain)
WHERE h.stage_name = 'Closed/Won'
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
