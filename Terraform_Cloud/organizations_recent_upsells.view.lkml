view: tfc_organizations_recent_upsells {
  derived_table: {
    sql:

      select
        a.organization_id,
        cp.organization,
        a.start_at as upgraded_at,
        a.plan,
        a.previous_plan,
        b.billing_email
      from ${tfc_organizations_subscriptions.SQL_TABLE_NAME} a
      inner join ${tfc_organizations_current_plan.SQL_TABLE_NAME} cp
      on a.organization_id = cp.organization_id
      left join ${billing_details.SQL_TABLE_NAME} b
      on a.organization_id = b.organization_id

      where
        a.cost > previous_cost
        and a.plan <> previous_plan
        and a.plan not in ('Business','Legacy Paid Accounts')
      order by start_at desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: billing_email {
    type: string
    sql: ${TABLE}.billing_email ;;
  }

  dimension_group: upgraded_at {
    type: time
    sql: ${TABLE}.upgraded_at ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: previous_plan {
    type: string
    sql: ${TABLE}.previous_plan ;;
  }

  set: detail {
    fields: [organization_id, upgraded_at_time, plan, previous_plan]
  }
}
