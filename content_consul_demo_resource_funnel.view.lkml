view: content_consul_demo_resource_funnel {
  sql_table_name:  content_performance.consul_demo_resource_funnel ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: funnel_event {
    type: string
    sql: ${TABLE}.funnel_event ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_unique {
    type: count_distinct
    drill_fields: [user_anonymous_id]
  }
}
