view: oss_downloads {
  sql_table_name:  oss_downloads ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    type:  string
    sql: ${TABLE}.product;;
  }

  dimension: context_ip {
    type:  string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: downloads_count {
    type: count
    drill_fields: [id, product]
  }

  measure: downloads_count_unique_ips {
    type: count_distinct
    sql: ${context_ip} ;;
  }
}
