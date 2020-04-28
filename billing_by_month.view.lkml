view: billing_by_month {
  sql_table_name: public.billing_by_month ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bill {
    type: number
    sql: ${TABLE}.bill ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.month ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
