view: datocms_publishes {
  sql_table_name:  datocms.enriched_publishes ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.publish_id ;;
  }

  dimension: published_item_type {
    type:  string
    sql: ${TABLE}.updated_item_type;;
  }

  dimension: author_email {
    type:  string
    sql: ${TABLE}.author_email;;
  }

  dimension: author_name {
    type:  string
    sql: ${TABLE}.author_name;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
