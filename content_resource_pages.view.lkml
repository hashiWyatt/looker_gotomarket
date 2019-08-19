view: content_resource_pages {
  sql_table_name:  content_performance.resource_pages ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: path {
    type:  string
    sql: ${TABLE}.path;;
  }

  dimension: page_title {
    type:  string
    sql: ${TABLE}.page_title ;;
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

  dimension_group: published_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.published_date ;;
  }

  measure: pageviews_count {
    type: count
    drill_fields: [id]
  }
}
