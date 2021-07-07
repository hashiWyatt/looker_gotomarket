view: tfc_business_pqls {
  derived_table: {
    sql:
      select
        a.organization_id,
        cp.organization,
        billing_email,
        country,
        cp.plan,
        (cp.cost * 12 * max(a.active_users_30days))::decimal / 100 as current_estimated_acv,
        max(a.active_users_30days) as active_users_30days
      from
      ${tfc_organizations_active.SQL_TABLE_NAME} a
      inner join ${tfc_organizations_current_plan.SQL_TABLE_NAME} cp
      on a.organization_id = cp.organization_id
      left join ${billing_details.SQL_TABLE_NAME} b
      on a.organization_id = b.organization_id
      where plan not in ('Business','Legacy Paid Accounts')
      and date_trunc('month', event_at) = date_trunc('month', getdate())
      and a.active_users_30days >= 10
      group by a.organization_id, cp.organization, billing_email, country, cp.plan, cp.cost
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

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: current_estimated_acv {
    type: number
    sql: ${TABLE}.current_estimated_acv ;;
  }

  dimension: active_users_30days {
    type: number
    sql: ${TABLE}.active_users_30days ;;
  }

  set: detail {
    fields: [
      organization_id,
      organization,
      billing_email,
      country,
      plan,
      current_estimated_acv,
      active_users_30days
    ]
  }
}
