view: terraform_cloud_rolling_retention_cohort_retained_users {
  derived_table: {
    sql:
     select entity_id from (
      select entity_id, date_trunc('month', event_at), count(*) from ${terraform_cloud_rolling_retention_cohort_events.SQL_TABLE_NAME}
      where event in ('state_version_created') group by entity_id, 2
      having count(*) >= 3
     )
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: entity_id {
    type: number
    sql: ${TABLE}.entity_id ;;
  }
}
