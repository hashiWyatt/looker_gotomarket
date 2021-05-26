view: tfc_organizations_signups {
  derived_table: {
    sql: select
      start_at,
      organization_id,
      plan
    from ${tfc_organizations_subscriptions.SQL_TABLE_NAME}
    where
      organization_id not in (select organization_id from ${tfc_internal_organizations.SQL_TABLE_NAME})
      and previous_cost = 0 and cost > 0
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }


  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  set: detail {
    fields: [start_at_time, organization_id]
  }
}
