view: hashiconf_pages_2021 {
  sql_table_name:  hashiconf_next.calculated_pages_2021 ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: event {
    type:  string
    sql: ${TABLE}.event ;;
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

  dimension: calculated_source {
    type: string
    sql: ${TABLE}.calculated_source ;;
  }


  dimension: campaign_medium {
    type: string
    sql: ${TABLE}.campaign_medium ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_unique {
    type: count
    drill_fields: [anonymous_id]
  }
}
