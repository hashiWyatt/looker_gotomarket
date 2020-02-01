view: leads_per_product {
  sql_table_name: salesforce.leads_per_product ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension_group: create_date_time {
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
    sql: ${TABLE}.create_date_time_c ;;
  }

  measure: count {
    type: count
  }

  }
