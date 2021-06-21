view: tfc_organizations_current_plan {
  derived_table: {
    sql: with
      tfc_organizations_subscriptions as (
      select
          organization_id,
          organization,
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
      )

      select distinct
        organization_id,
        organization,
        last_value(plan) over (partition by organization_id order by start_at rows BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as plan,
        last_value(cost) over (partition by organization_id order by start_at rows BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as cost
      from ${tfc_organizations_subscriptions.SQL_TABLE_NAME}
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

  set: detail {
    fields: [organization_id, plan]
  }
}
