view: usage_by_schema_snapshots {
  sql_table_name: mia_syncs.usage_by_schema_snapshots ;;

  dimension: schemaname {
    type: string
    sql: ${TABLE}.schemaname ;;
  }

  dimension_group: snapshot {
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
    datatype: date
    sql: ${TABLE}.snapshot_date ;;
  }

  dimension: total_mb {
    type: number
    sql: ${TABLE}.total_mb ;;
  }

  measure: count {
    type: count
    drill_fields: [schemaname]
  }
}
