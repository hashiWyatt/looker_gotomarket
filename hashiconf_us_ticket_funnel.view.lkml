view: hashiconf_us_ticket_funnel {
  sql_table_name:  hashiconf_next.us_tickets_funnel ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}