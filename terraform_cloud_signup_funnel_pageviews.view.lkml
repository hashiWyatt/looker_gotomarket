view: terraform_cloud_signup_funnel_pageviews {
  sql_table_name:  terraform_cloud.signup_funnel_pageviews ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: path {
    type:  string
    sql: ${TABLE}.path;;
  }

  dimension: utm_campaign {
    type:  string
    sql: ${TABLE}.utm_campaign;;
  }

  dimension: utm_source {
    type:  string
    sql: ${TABLE}.utm_source;;
  }

  dimension: utm_medium {
    type:  string
    sql: ${TABLE}.utm_medium;;
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

  measure: pageviews_count {
    type: count
    drill_fields: [id]
  }
}
