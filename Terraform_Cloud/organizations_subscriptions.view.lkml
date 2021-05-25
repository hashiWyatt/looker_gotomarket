view: tfc_organizations_subscriptions {
  derived_table: {
    sql:
      select
    organization_id,
    original_timestamp as start_at,
    coalesce(LEAD(original_timestamp, 1) OVER (partition by organization_id order by original_timestamp), getdate() + '1 month'::interval) as end_at,
    new_subscription_plan as plan,
    case
      when new_subscription_plan in ('Legacy Paid Accounts', 'Business') then 100000
      else new_subscription_cost
    end as cost,
    previous_subscription_plan as previous_plan,
    case
      when previous_subscription_plan in ('Legacy Paid Accounts', 'Business') then 100000
      else previous_subscription_cost
    end as previous_cost
  from terraform_cloud.update_subscription
  where organization_id is not null
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

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: previous_plan {
    type: string
    sql: ${TABLE}.previous_plan ;;
  }

  dimension: previous_cost {
    type: number
    sql: ${TABLE}.previous_cost ;;
  }


  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }

  dimension_group: end_at {
    type: time
    sql: ${TABLE}.end_at ;;
  }

  set: detail {
    fields: [organization_id, plan, cost, start_at_time, end_at_time, previous_cost, previous_plan]
  }
}
