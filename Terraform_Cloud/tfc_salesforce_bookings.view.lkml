view: tfc_salesforce_bookings {
  derived_table: {
    sql:
      select
        sfdc.*,
        reporting.*,
        org_opp_mapping.organization_id
      from (
        select distinct
          opportunity_id,
          account.name,
          opportunity.type,
          opportunity.y_1_acv_clari_c::decimal(14,2) as acv,
          (close_date)::date as start_at,
          (close_date + '365 days'::interval)::date as end_at,
          account.id as customer_id
          from salesforce_v2.opportunity_line_item, salesforce_v2.product_2 as product, salesforce_v2.opportunity, salesforce_v2.account
        where
          (product.name like 'Terraform Cloud %' or product.name like '%Terraform Pro %' or product.name like '%Terraform %SaaS%')
          and opportunity_line_item.product_2_id = product.id
          and opportunity_line_item.opportunity_id = opportunity.id
          and opportunity.account_id = account.id
          and is_won
      ) as sfdc
      inner join ${reporting_all_day_intervals.SQL_TABLE_NAME} as reporting
      on sfdc.start_at <= reporting.day and sfdc.end_at >= reporting.day
      left join
      (select distinct organization_id, contract_opportunity_id from terraform_cloud.update_subscription where new_subscription_plan = 'Business' and contract_opportunity_id is not null) as org_opp_mapping
      on sfdc.opportunity_id = org_opp_mapping.contract_opportunity_id

      ;;
  }
  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }
  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: acv {
    type: number
    sql: ${TABLE}.acv ;;
  }
  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }
  dimension_group: end_at {
    type: time
    sql: ${TABLE}.end_at ;;
  }
  dimension_group: reporting_day {
    type: time
    sql: ${TABLE}.day ;;
  }
  measure: sum_acv {
    type: sum
    sql: ${acv} ;;
  }
  measure: count {
    type: count
    drill_fields: [opportunity_id]
  }
}
