view: cloud_organization_c {
  sql_table_name: salesforce_v2.cloud_organization_c ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }

  dimension: cloud_credit_balance_c {
    type: number
    sql: ${TABLE}.cloud_credit_balance_c ;;
  }

  dimension: cloud_organization_creator_c {
    type: string
    sql: ${TABLE}.cloud_organization_creator_c ;;
  }

  dimension: cloud_organization_id_c {
    type: string
    # hidden: yes
    sql: ${TABLE}.cloud_organization_id_c ;;
  }

  dimension: cloud_organization_owner_c {
    type: string
    sql: ${TABLE}.cloud_organization_owner_c ;;
  }

  dimension: contract_c {
    type: string
    sql: ${TABLE}.contract_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: delinquency_status_c {
    type: string
    sql: ${TABLE}.delinquency_status_c ;;
  }

  dimension: entitlement_applies_c {
    type: number
    sql: ${TABLE}.entitlement_applies_c ;;
  }

  dimension: entitlement_concurrent_runs_c {
    type: number
    sql: ${TABLE}.entitlement_concurrent_runs_c ;;
  }

  dimension: entitlement_users_c {
    type: number
    sql: ${TABLE}.entitlement_users_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: subscription_plan_c {
    type: string
    sql: ${TABLE}.subscription_plan_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: total_applies_c {
    type: number
    sql: ${TABLE}.total_applies_c ;;
  }

  dimension: total_concurrent_runs_c {
    type: number
    sql: ${TABLE}.total_concurrent_runs_c ;;
  }

  dimension: total_runs_c {
    type: number
    sql: ${TABLE}.total_runs_c ;;
  }

  dimension: total_states_created_c {
    type: number
    sql: ${TABLE}.total_states_created_c ;;
  }

  dimension: total_users_c {
    type: number
    sql: ${TABLE}.total_users_c ;;
  }

  dimension: total_users_remaining_c {
    type: number
    sql: ${TABLE}.total_users_remaining_c ;;
  }

  dimension: total_workspaces_c {
    type: number
    sql: ${TABLE}.total_workspaces_c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      cloud_organization_c.name,
      cloud_organization_c.id,
      cloud_organization_c.count,
      cloud_organization_invoice_c.count,
      cloud_organization_member_c.count,
      cloud_organization_opportunity_c.count,
      cloud_organization_usage_c.count
    ]
  }
}
