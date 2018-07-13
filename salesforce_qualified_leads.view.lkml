view: salesforce_qualified_leads {
  derived_table: {
    sql: SELECT COUNT(DISTINCT l.id) as count, date_trunc('month', l.created_date) as month FROM "salesforce"."leads" as l, "salesforce"."lead_history" as h WHERE l.id = h.lead_id AND (h.field = 'Status'
      AND h.new_value = 'Qualified') GROUP BY date_trunc('month', l.created_date)
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
