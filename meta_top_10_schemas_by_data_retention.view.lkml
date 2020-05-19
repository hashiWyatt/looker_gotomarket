view: top_10_schemas_by_data_retention {
  derived_table: {
    sql: SELECT * FROM public.usage_by_schema WHERE schemaname NOT LIKE 'pg_temp%' ORDER BY total_mb DESC
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_mb_all {
    type: sum
    sql: ${total_mb} ;;
  }

  dimension: schemaname {
    type: string
    sql: ${TABLE}.schemaname ;;
  }

  dimension: total_mb {
    type: number
    sql: ${TABLE}.total_mb ;;
  }

  set: detail {
    fields: [schemaname, total_mb]
  }
}
