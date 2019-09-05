view: accounts {
  sql_table_name: salesforce.accounts ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_counter_c {
    type: number
    sql: ${TABLE}.account_counter_c ;;
  }

  dimension: auto_renew_c {
    type: yesno
    sql: ${TABLE}.auto_renew_c ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension_group: budget_planning_cycle_c {
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
    sql: ${TABLE}.budget_planning_cycle_c ;;
  }

  dimension: cbit_clearbit_c {
    type: string
    sql: ${TABLE}.cbit_clearbit_c ;;
  }

  dimension: cbit_clearbit_domain_c {
    type: string
    sql: ${TABLE}.cbit_clearbit_domain_c ;;
  }

  dimension: cbit_clearbit_ready_c {
    type: yesno
    sql: ${TABLE}.cbit_clearbit_ready_c ;;
  }

  dimension: cbit_created_by_clearbit_c {
    type: yesno
    sql: ${TABLE}.cbit_created_by_clearbit_c ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dscorgpkg_conflict_c {
    type: string
    sql: ${TABLE}.dscorgpkg_conflict_c ;;
  }

  dimension: dscorgpkg_deleted_from_discover_org_c {
    type: string
    sql: ${TABLE}.dscorgpkg_deleted_from_discover_org_c ;;
  }

  dimension_group: dscorgpkg_discover_org_created_on_c {
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
    sql: ${TABLE}.dscorgpkg_discover_org_created_on_c ;;
  }

  dimension_group: dscorgpkg_discover_org_first_update_c {
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
    sql: ${TABLE}.dscorgpkg_discover_org_first_update_c ;;
  }

  dimension: dscorgpkg_discover_org_full_country_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_full_country_name_c ;;
  }

  dimension: dscorgpkg_discover_org_id_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_id_c ;;
  }

  dimension_group: dscorgpkg_discover_org_last_update_c {
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
    sql: ${TABLE}.dscorgpkg_discover_org_last_update_c ;;
  }

  dimension: dscorgpkg_discover_org_state_full_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_state_full_name_c ;;
  }

  dimension: dscorgpkg_discover_org_technologies_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_technologies_c ;;
  }

  dimension: dscorgpkg_do_3_yr_employees_growth_c {
    type: string
    sql: ${TABLE}.dscorgpkg_do_3_yr_employees_growth_c ;;
  }

  dimension: dscorgpkg_do_3_yr_sales_growth_c {
    type: string
    sql: ${TABLE}.dscorgpkg_do_3_yr_sales_growth_c ;;
  }

  dimension: dscorgpkg_exclude_update_c {
    type: yesno
    sql: ${TABLE}.dscorgpkg_exclude_update_c ;;
  }

  dimension: dscorgpkg_external_discover_org_id_c {
    type: string
    sql: ${TABLE}.dscorgpkg_external_discover_org_id_c ;;
  }

  dimension: dscorgpkg_fiscal_year_end_c {
    type: string
    sql: ${TABLE}.dscorgpkg_fiscal_year_end_c ;;
  }

  dimension: dscorgpkg_it_budget_c {
    type: number
    sql: ${TABLE}.dscorgpkg_it_budget_c ;;
  }

  dimension: dscorgpkg_it_employees_c {
    type: number
    sql: ${TABLE}.dscorgpkg_it_employees_c ;;
  }

  dimension: dscorgpkg_itorg_chart_c {
    type: string
    sql: ${TABLE}.dscorgpkg_itorg_chart_c ;;
  }

  dimension: dscorgpkg_lead_source_c {
    type: string
    sql: ${TABLE}.dscorgpkg_lead_source_c ;;
  }

  dimension: dscorgpkg_naics_codes_c {
    type: string
    sql: ${TABLE}.dscorgpkg_naics_codes_c ;;
  }

  dimension: dscorgpkg_ownership_c {
    type: string
    sql: ${TABLE}.dscorgpkg_ownership_c ;;
  }

  dimension: dscorgpkg_sic_codes_c {
    type: string
    sql: ${TABLE}.dscorgpkg_sic_codes_c ;;
  }

  dimension: email_domain_c {
    type: string
    sql: ${TABLE}.email_domain_c ;;
  }

  dimension: federal_tax_id_c {
    type: string
    sql: ${TABLE}.federal_tax_id_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
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

  dimension: lifecycle_stage_c {
    type: string
    sql: ${TABLE}.lifecycle_stage_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mdf_c {
    type: string
    sql: ${TABLE}.mdf_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_c {
    type: string
    sql: ${TABLE}.partner_c ;;
  }

  dimension: partner_margin_c {
    type: string
    sql: ${TABLE}.partner_margin_c ;;
  }

  dimension: partner_type_c {
    type: string
    sql: ${TABLE}.partner_type_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: pipeline_amount_c {
    type: string
    sql: ${TABLE}.pipeline_amount_c ;;
  }

  dimension_group: primary_contract_date_c {
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
    sql: ${TABLE}.primary_contract_date_c ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: renewal_total_c {
    type: string
    sql: ${TABLE}.renewal_total_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: solutions_engineer_c {
    type: string
    sql: ${TABLE}.solutions_engineer_c ;;
  }

  dimension: support_level_c {
    type: string
    sql: ${TABLE}.support_level_c ;;
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

  dimension: target_list_segments_c {
    type: string
    sql: ${TABLE}.target_list_segments_c ;;
  }

  dimension: tas_total_account_spend_c {
    type: string
    sql: ${TABLE}.tas_total_account_spend_c ;;
  }

  dimension: tier_c {
    type: string
    sql: ${TABLE}.tier_c ;;
  }

  dimension: track_security_group_mgtrx_c {
    type: yesno
    sql: ${TABLE}.track_security_group_mgtrx_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension_group: x1_st_won_deal_date_c {
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
    sql: ${TABLE}.x1_st_won_deal_date_c ;;
  }

  dimension: x1_y_acv_c {
    type: string
    sql: ${TABLE}.x1_y_acv_c ;;
  }

  dimension: zendesk_create_in_zendesk_c {
    type: yesno
    sql: ${TABLE}.zendesk_create_in_zendesk_c ;;
  }

  dimension: zendesk_created_updated_flag_c {
    type: yesno
    sql: ${TABLE}.zendesk_created_updated_flag_c ;;
  }

  dimension: zendesk_domain_mapping_c {
    type: string
    sql: ${TABLE}.zendesk_domain_mapping_c ;;
  }

  dimension_group: zendesk_last_sync_date_c {
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
    sql: ${TABLE}.zendesk_last_sync_date_c ;;
  }

  dimension: zendesk_last_sync_status_c {
    type: string
    sql: ${TABLE}.zendesk_last_sync_status_c ;;
  }

  dimension: zendesk_result_c {
    type: string
    sql: ${TABLE}.zendesk_result_c ;;
  }

  dimension: zendesk_tags_c {
    type: string
    sql: ${TABLE}.zendesk_tags_c ;;
  }

  dimension: zendesk_zendesk_organization_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_organization_c ;;
  }

  dimension: zendesk_zendesk_organization_id_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_organization_id_c ;;
  }

  dimension: zendesk_zendesk_outof_sync_c {
    type: yesno
    sql: ${TABLE}.zendesk_zendesk_outof_sync_c ;;
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
      products.family,
      products.product_code,
      contacts.count,
      contracts.count,
      events.count,
      opportunities.count,
      tasks.count
    ]
  }
}
