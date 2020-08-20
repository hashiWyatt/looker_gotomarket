view: terraform_cloud_salesforce_bookings {
  derived_table: {
    sql:
      select * from (
        select distinct
          opportunity_id,
          accounts.name,
          opportunities.type,
          opportunities.y_1_acv_c::decimal(14,2) as acv,
          (close_date)::date as start_at,
          (close_date + '365 days'::interval)::date as end_at,
          accounts.id as customer_id
          from salesforce.opportunity_product, salesforce.products, salesforce.opportunities, salesforce.accounts
        where
          products.name like 'Terraform Cloud %'
          and opportunity_product.product_2_id = products.id
          and opportunity_product.opportunity_id = opportunities.id
          and opportunities.account_id = accounts.id
          and is_won)
      as sfdc, ${reporting_all_day_intervals.SQL_TABLE_NAME} as reporting
      where
      sfdc.start_at <= reporting.day and sfdc.end_at >= reporting.day
      ;;
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
