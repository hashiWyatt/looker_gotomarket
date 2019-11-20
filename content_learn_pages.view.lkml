view: content_learn_pages {
  sql_table_name:  content_performance.learn_pages ;;

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

  dimension: product {
    type:  string
    sql: ${TABLE}.product ;;
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
    drill_fields: [page_title, product, path, published_date_date]
  }
}
