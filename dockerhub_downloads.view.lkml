view: dockerhub_downloads {
  sql_table_name: releases_etl.dockerhub_downloads ;;

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_updated ;;
  }

  # dimension: pull_count {
  #   type: number
  #   sql: ${TABLE}.pull_count ;;
  # }

  dimension_group: recorded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recorded_date ;;
  }

  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }

  measure: star_count {
    type: number
    drill_fields: [star_count]
  }

  measure: pull_count {
    type: number
    drill_fields: [pull_count]
  }

  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}
