view: opportunity_lead_conversiontimes {
  derived_table: {
    sql: SELECT o.id as op_id,
       datediff(day, l.created_date, o.close_date) as leadcreation_close_days,
       datediff(day, o.created_date, o.close_date) as oppcreation_close_days
FROM salesforce.leads as l
LEFT JOIN salesforce.opportunities as o ON (o.id = l.converted_opportunity_id)
WHERE o.is_won = TRUE AND o.is_closed = TRUE
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: op_id {
    type: string
    sql: ${TABLE}.op_id ;;
    primary_key: yes
  }

  dimension: leadcreation_close_days {
    type: number
    sql: ${TABLE}.leadcreation_close_days ;;
  }

  dimension: oppcreation_close_days {
    type: number
    sql: ${TABLE}.oppcreation_close_days ;;
  }

  set: detail {
    fields: [op_id, leadcreation_close_days, oppcreation_close_days]
  }
}
