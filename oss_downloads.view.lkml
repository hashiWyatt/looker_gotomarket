view: oss_downloads {
  derived_table: {
    sql: -- Get OSS downloads in the last 2 hours
      (
        SELECT product, context_ip, timestamp
        FROM consul_oss_site.download
        WHERE timestamp::timestamp AT TIME ZONE 'UTC' >= (SELECT current_timestamp - INTERVAL '2 hours')
      )
      UNION
      (
        SELECT product, context_ip, timestamp
        FROM terraform_oss_site.download
        WHERE timestamp::timestamp AT TIME ZONE 'UTC' >= (SELECT current_timestamp - INTERVAL '2 hours')
      )
      UNION
      (
        SELECT product, context_ip, timestamp
        FROM vault_oss_site.download
        WHERE timestamp::timestamp AT TIME ZONE 'UTC' >= (SELECT current_timestamp - INTERVAL '2 hours')
      )
      ORDER BY timestamp DESC;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  set: detail {
    fields: [product, context_ip, timestamp_time]
  }
}
