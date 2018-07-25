view: leads_qualified_g2000 {
  derived_table: {
    sql: SELECT COUNT(DISTINCT l.website),
       date_trunc('month', l.created_date) as month
FROM salesforce.leads as l
INNER JOIN salesforce.lead_history as h ON (l.id = h.lead_id)
INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (l.website = g.domain)
WHERE h.Field = 'Status' and h.new_value = 'Qualified'
GROUP BY month;
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
