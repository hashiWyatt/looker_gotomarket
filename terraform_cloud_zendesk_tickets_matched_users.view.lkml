view: terraform_cloud_zendesk_tickets_matched_users {
  derived_table: {
    sql: with tf_tickets as (
        select
          via_channel,
          via_source_from_address,
          via_source_to_address,
          priority,
          custom_product,
          custom_terraform_sub_product,
          created_at
        from zendesk.ticket
        where custom_product ilike '%terraform%'
      ), org_people as (
        select distinct at.user_id, at.organization, u.email from terraform_cloud.add_user_to_team at, terraform_cloud.users u
        where at.user_id = u.id
      )
      , org_plans as (
        select organization_id, organization, plan from (
          select
            organization_id,
            organization,
            coalesce(new_subscription_plan, previous_subscription_plan) as plan,
            row_number() over (partition by organization_id, organization order by original_timestamp desc) as latest
          from terraform_cloud.update_org_subscription
        ) as latest_plans
        where latest = 1
      )
      , tf_user_tiers as (
        select p.user_id, p.email, p.organization, op.organization_id, op.plan from org_people p, org_plans op
        where p.organization = op.organization
      )

      select
         t.*,
         u.user_id as matched_user_id,
         u.organization as matched_organization_name,
         u.organization_id as matched_organization_id,
         u.plan as matched_organization_plan_tier
      from
        tf_tickets t
      left join tf_user_tiers u
      on t.via_source_from_address = u.email
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: via_channel {
    type: string
    sql: ${TABLE}.via_channel ;;
  }

  dimension: via_source_from_address {
    type: string
    sql: ${TABLE}.via_source_from_address ;;
  }

  dimension: via_source_to_address {
    type: string
    sql: ${TABLE}.via_source_to_address ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: custom_product {
    type: string
    sql: ${TABLE}.custom_product ;;
  }

  dimension: custom_terraform_sub_product {
    type: string
    sql: ${TABLE}.custom_terraform_sub_product ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: matched_user_id {
    type: string
    sql: ${TABLE}.matched_user_id ;;
  }

  dimension: matched_organization_name {
    type: string
    sql: ${TABLE}.matched_organization_name ;;
  }

  dimension: matched_organization_id {
    type: string
    sql: ${TABLE}.matched_organization_id ;;
  }

  dimension: matched_organization_plan_tier {
    type: string
    sql: ${TABLE}.matched_organization_plan_tier ;;
  }

  set: detail {
    fields: [
      via_channel,
      via_source_from_address,
      via_source_to_address,
      priority,
      custom_product,
      custom_terraform_sub_product,
      created_at_time,
      matched_user_id,
      matched_organization_name,
      matched_organization_id,
      matched_organization_plan_tier
    ]
  }
}
