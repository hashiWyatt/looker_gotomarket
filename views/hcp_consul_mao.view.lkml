view: hcp_consul_mao {
  sql_table_name: cloud_gtm.hcp_consul_mao ;;

  dimension_group: cal {
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
    sql: ${TABLE}.cal_date ;;
  }

  dimension: fri {
    type: yesno
    sql: ${TABLE}.fri ;;
  }

  dimension: hcp_mao {
    type: number
    sql: ${TABLE}.hcp_mao ;;
  }

  dimension: last_fri_of_month {
    type: yesno
    sql: ${TABLE}.last_fri_of_month ;;
  }

  dimension: last_fri_of_quarter {
    type: yesno
    sql: ${TABLE}.last_fri_of_quarter ;;
  }

  dimension: most_recent {
    type: yesno
    sql: ${TABLE}.most_recent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
