view: hhw_enriched_pages {
  sql_table_name:  how_hashicorp_works.enriched_pages ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: is_employee {
    type: yesno
    sql: ${TABLE}.is_employee ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_unique {
    type: count
    drill_fields: [user_id]
  }
}
