view: lead_v2 {
  sql_table_name: salesforce_v2.lead ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_active {
    type: yesno
    sql: ${TABLE}._fivetran_active ;;
  }

  dimension_group: _fivetran_end {
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
    sql: ${TABLE}._fivetran_end ;;
  }

  dimension_group: _fivetran_start {
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
    sql: ${TABLE}._fivetran_start ;;
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

  dimension: accept_terms_mgtrx_c {
    type: yesno
    sql: ${TABLE}.accept_terms_mgtrx_c ;;
  }

  dimension: ad_campaign_name_ft_c {
    type: string
    sql: ${TABLE}.ad_campaign_name_ft_c ;;
  }

  dimension: ad_campaign_name_lc_c {
    type: string
    sql: ${TABLE}.ad_campaign_name_lc_c ;;
  }

  dimension: age_c {
    type: number
    sql: ${TABLE}.age_c ;;
  }

  dimension: all_product_interests_c {
    type: string
    sql: ${TABLE}.all_product_interests_c ;;
  }

  dimension: alt_test_lead_source_bucket_c {
    type: string
    sql: ${TABLE}.alt_test_lead_source_bucket_c ;;
  }

  dimension: alt_test_lead_source_c {
    type: string
    sql: ${TABLE}.alt_test_lead_source_c ;;
  }

  dimension: alt_test_lsb_txt_c {
    type: string
    sql: ${TABLE}.alt_test_lsb_txt_c ;;
  }

  dimension: automation_sync_c {
    type: yesno
    sql: ${TABLE}.automation_sync_c ;;
  }

  dimension: behavior_fit_c {
    type: string
    sql: ${TABLE}.behavior_fit_c ;;
  }

  dimension: behavior_score_c {
    type: number
    sql: ${TABLE}.behavior_score_c ;;
  }

  dimension: behavioral_historical_c {
    type: yesno
    sql: ${TABLE}.behavioral_historical_c ;;
  }

  dimension_group: behavioral_most_recent_date_c {
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
    sql: ${TABLE}.behavioral_most_recent_date_c ;;
  }

  dimension: billing_plan_type_c {
    type: string
    sql: ${TABLE}.billing_plan_type_c ;;
  }

  dimension: bizible_2_account_c {
    type: string
    sql: ${TABLE}.bizible_2_account_c ;;
  }

  dimension: bizible_2_ad_campaign_name_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_ad_campaign_name_ft_c ;;
  }

  dimension: bizible_2_ad_campaign_name_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_ad_campaign_name_lc_c ;;
  }

  dimension: bizible_2_bizible_id_c {
    type: string
    sql: ${TABLE}.bizible_2_bizible_id_c ;;
  }

  dimension: bizible_2_landing_page_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_landing_page_ft_c ;;
  }

  dimension: bizible_2_landing_page_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_landing_page_lc_c ;;
  }

  dimension: bizible_2_marketing_channel_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_marketing_channel_ft_c ;;
  }

  dimension: bizible_2_marketing_channel_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_marketing_channel_lc_c ;;
  }

  dimension_group: bizible_2_touchpoint_date_ft_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_date_ft_c ;;
  }

  dimension_group: bizible_2_touchpoint_date_lc_c {
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
    sql: ${TABLE}.bizible_2_touchpoint_date_lc_c ;;
  }

  dimension: bizible_2_touchpoint_source_ft_c {
    type: string
    sql: ${TABLE}.bizible_2_touchpoint_source_ft_c ;;
  }

  dimension: bizible_2_touchpoint_source_lc_c {
    type: string
    sql: ${TABLE}.bizible_2_touchpoint_source_lc_c ;;
  }

  dimension: boundary_c {
    type: yesno
    sql: ${TABLE}.boundary_c ;;
  }

  dimension: brigght_talk_user_id_c {
    type: string
    sql: ${TABLE}.brigght_talk_user_id_c ;;
  }

  dimension: budget_confirmed_c {
    type: yesno
    sql: ${TABLE}.budget_confirmed_c ;;
  }

  dimension: budget_details_c {
    type: string
    sql: ${TABLE}.budget_details_c ;;
  }

  dimension: campaign_id_c {
    type: string
    sql: ${TABLE}.campaign_id_c ;;
  }

  dimension: cb_active_stage_count_c {
    type: number
    sql: ${TABLE}.cb_active_stage_count_c ;;
  }

  dimension: cb_churned_stage_count_c {
    type: number
    sql: ${TABLE}.cb_churned_stage_count_c ;;
  }

  dimension: cb_inactive_stage_count_c {
    type: number
    sql: ${TABLE}.cb_inactive_stage_count_c ;;
  }

  dimension: cb_known_stage_count_c {
    type: number
    sql: ${TABLE}.cb_known_stage_count_c ;;
  }

  dimension_group: cb_most_recent_active_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_active_stage_date_c ;;
  }

  dimension_group: cb_most_recent_churned_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_churned_stage_date_c ;;
  }

  dimension_group: cb_most_recent_inactive_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_inactive_stage_date_c ;;
  }

  dimension_group: cb_most_recent_known_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_known_stage_date_c ;;
  }

  dimension_group: cb_most_recent_signed_up_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_signed_up_stage_date_c ;;
  }

  dimension_group: cb_most_recent_verified_stage_date_c {
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
    sql: ${TABLE}.cb_most_recent_verified_stage_date_c ;;
  }

  dimension_group: cb_original_active_stage_date_c {
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
    sql: ${TABLE}.cb_original_active_stage_date_c ;;
  }

  dimension_group: cb_original_churned_stage_date_c {
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
    sql: ${TABLE}.cb_original_churned_stage_date_c ;;
  }

  dimension_group: cb_original_inactive_stage_date_c {
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
    sql: ${TABLE}.cb_original_inactive_stage_date_c ;;
  }

  dimension_group: cb_original_known_stage_date_c {
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
    sql: ${TABLE}.cb_original_known_stage_date_c ;;
  }

  dimension_group: cb_original_paying_stage_date_c {
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
    sql: ${TABLE}.cb_original_paying_stage_date_c ;;
  }

  dimension_group: cb_original_signed_up_stage_date_c {
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
    sql: ${TABLE}.cb_original_signed_up_stage_date_c ;;
  }

  dimension_group: cb_original_verified_stage_date_c {
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
    sql: ${TABLE}.cb_original_verified_stage_date_c ;;
  }

  dimension: cb_paying_stage_count_c {
    type: number
    sql: ${TABLE}.cb_paying_stage_count_c ;;
  }

  dimension: cb_signed_up_stage_count_c {
    type: number
    sql: ${TABLE}.cb_signed_up_stage_count_c ;;
  }

  dimension: cb_verified_stage_count_c {
    type: number
    sql: ${TABLE}.cb_verified_stage_count_c ;;
  }

  dimension: cbit_clearbit_c {
    type: string
    sql: ${TABLE}.cbit_clearbit_c ;;
  }

  dimension: cbit_clearbit_ready_c {
    type: yesno
    sql: ${TABLE}.cbit_clearbit_ready_c ;;
  }

  dimension: cbit_created_by_clearbit_c {
    type: yesno
    sql: ${TABLE}.cbit_created_by_clearbit_c ;;
  }

  dimension: cbit_facebook_c {
    type: string
    sql: ${TABLE}.cbit_facebook_c ;;
  }

  dimension: cbit_linked_in_c {
    type: string
    sql: ${TABLE}.cbit_linked_in_c ;;
  }

  dimension: cbit_twitter_c {
    type: string
    sql: ${TABLE}.cbit_twitter_c ;;
  }

  dimension: channel_in_c {
    type: yesno
    sql: ${TABLE}.channel_in_c ;;
  }

  dimension: channel_rep_c {
    type: string
    sql: ${TABLE}.channel_rep_c ;;
  }

  dimension: churn_stage_count_c {
    type: number
    sql: ${TABLE}.churn_stage_count_c ;;
  }

  dimension_group: churn_stage_date_c {
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
    sql: ${TABLE}.churn_stage_date_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: clearbit_country_c {
    type: string
    sql: ${TABLE}.clearbit_country_c ;;
  }

  dimension: clearbit_matched_company_c {
    type: string
    sql: ${TABLE}.clearbit_matched_company_c ;;
  }

  dimension: clearbit_state_c {
    type: string
    sql: ${TABLE}.clearbit_state_c ;;
  }

  dimension: clearbit_technologies_c {
    type: string
    sql: ${TABLE}.clearbit_technologies_c ;;
  }

  dimension: closed_lost_stage_count_c {
    type: number
    sql: ${TABLE}.closed_lost_stage_count_c ;;
  }

  dimension_group: closed_lost_stage_date_c {
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
    sql: ${TABLE}.closed_lost_stage_date_c ;;
  }

  dimension: cloud_provider_interest_c {
    type: string
    sql: ${TABLE}.cloud_provider_interest_c ;;
  }

  dimension: cluster_count_c {
    type: number
    sql: ${TABLE}.cluster_count_c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: completed_task_count_c {
    type: number
    sql: ${TABLE}.completed_task_count_c ;;
  }

  dimension: consent_privacy_policy_c {
    type: yesno
    sql: ${TABLE}.consent_privacy_policy_c ;;
  }

  dimension_group: consent_privacy_policy_opt_in_date_c {
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
    sql: ${TABLE}.consent_privacy_policy_opt_in_date_c ;;
  }

  dimension: consul_c {
    type: yesno
    sql: ${TABLE}.consul_c ;;
  }

  dimension: consul_service_instances_c {
    type: number
    sql: ${TABLE}.consul_service_instances_c ;;
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension_group: converted {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: count_of_activities_c {
    type: number
    sql: ${TABLE}.count_of_activities_c ;;
  }

  dimension: count_of_leads_c {
    type: number
    sql: ${TABLE}.count_of_leads_c ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: create_date_time_c {
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
    sql: ${TABLE}.create_date_time_c ;;
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

  dimension: customer_c {
    type: string
    sql: ${TABLE}.customer_c ;;
  }

  dimension: days_known_to_won_c {
    type: number
    sql: ${TABLE}.days_known_to_won_c ;;
  }

  dimension: days_since_last_activity_c {
    type: number
    sql: ${TABLE}.days_since_last_activity_c ;;
  }

  dimension: days_since_last_most_interested_product_c {
    type: number
    sql: ${TABLE}.days_since_last_most_interested_product_c ;;
  }

  dimension: days_since_lead_c {
    type: number
    sql: ${TABLE}.days_since_lead_c ;;
  }

  dimension: days_since_sal_c {
    type: number
    sql: ${TABLE}.days_since_sal_c ;;
  }

  dimension: days_since_working_c {
    type: number
    sql: ${TABLE}.days_since_working_c ;;
  }

  dimension: days_to_conversion_c {
    type: number
    sql: ${TABLE}.days_to_conversion_c ;;
  }

  dimension: deal_reg_lead_source_notes_c {
    type: string
    sql: ${TABLE}.deal_reg_lead_source_notes_c ;;
  }

  dimension_group: deal_registration_approval_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deal_registration_approval_c ;;
  }

  dimension: deal_registration_lead_source_c {
    type: string
    sql: ${TABLE}.deal_registration_lead_source_c ;;
  }

  dimension: deal_registration_number_c {
    type: string
    sql: ${TABLE}.deal_registration_number_c ;;
  }

  dimension: demographic_fit_c {
    type: string
    sql: ${TABLE}.demographic_fit_c ;;
  }

  dimension: demographic_score_c {
    type: number
    sql: ${TABLE}.demographic_score_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dgcc_budgeted_cost_c {
    type: number
    sql: ${TABLE}.dgcc_budgeted_cost_c ;;
  }

  dimension: dgcc_campaign_brand_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_brand_c ;;
  }

  dimension: dgcc_campaign_channel_enablement_type_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_channel_enablement_type_c ;;
  }

  dimension: dgcc_campaign_currency_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_currency_c ;;
  }

  dimension: dgcc_campaign_description_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_description_c ;;
  }

  dimension: dgcc_campaign_id_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_id_c ;;
  }

  dimension: dgcc_campaign_market_development_funds_c {
    type: yesno
    sql: ${TABLE}.dgcc_campaign_market_development_funds_c ;;
  }

  dimension: dgcc_campaign_name_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_name_c ;;
  }

  dimension: dgcc_campaign_offer_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_offer_c ;;
  }

  dimension: dgcc_campaign_partner_type_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_partner_type_c ;;
  }

  dimension: dgcc_campaign_producer_team_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_producer_team_c ;;
  }

  dimension: dgcc_campaign_product_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_product_c ;;
  }

  dimension: dgcc_campaign_program_type_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_program_type_c ;;
  }

  dimension: dgcc_campaign_region_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_region_c ;;
  }

  dimension: dgcc_campaign_type_c {
    type: string
    sql: ${TABLE}.dgcc_campaign_type_c ;;
  }

  dimension: dgcc_create_campaign_c {
    type: yesno
    sql: ${TABLE}.dgcc_create_campaign_c ;;
  }

  dimension_group: dgcc_end_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dgcc_end_date_c ;;
  }

  dimension_group: dgcc_execution_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dgcc_execution_date_c ;;
  }

  dimension: dgcc_notification_email_c {
    type: string
    sql: ${TABLE}.dgcc_notification_email_c ;;
  }

  dimension: dgcc_primary_campaign_partner_c {
    type: string
    sql: ${TABLE}.dgcc_primary_campaign_partner_c ;;
  }

  dimension_group: dgcc_start_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dgcc_start_date_c ;;
  }

  dimension: disposition_c {
    type: string
    sql: ${TABLE}.disposition_c ;;
  }

  dimension: disqualification_details_c {
    type: string
    sql: ${TABLE}.disqualification_details_c ;;
  }

  dimension: distribution_partner_c {
    type: string
    sql: ${TABLE}.distribution_partner_c ;;
  }

  dimension: distributor_picklist_c {
    type: string
    sql: ${TABLE}.distributor_picklist_c ;;
  }

  dimension: do_not_solicit_c {
    type: yesno
    sql: ${TABLE}.do_not_solicit_c ;;
  }

  dimension: do_not_sync_to_marketo_c {
    type: yesno
    sql: ${TABLE}.do_not_sync_to_marketo_c ;;
  }

  dimension: dozisf_zoom_info_company_id_c {
    type: string
    sql: ${TABLE}.dozisf_zoom_info_company_id_c ;;
  }

  dimension_group: dozisf_zoom_info_first_updated_c {
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
    sql: ${TABLE}.dozisf_zoom_info_first_updated_c ;;
  }

  dimension: dozisf_zoom_info_id_c {
    type: string
    sql: ${TABLE}.dozisf_zoom_info_id_c ;;
  }

  dimension_group: dozisf_zoom_info_last_updated_c {
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
    sql: ${TABLE}.dozisf_zoom_info_last_updated_c ;;
  }

  dimension: dscorgpkg_company_hq_address_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_address_c ;;
  }

  dimension: dscorgpkg_company_hq_city_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_city_c ;;
  }

  dimension: dscorgpkg_company_hq_country_code_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_country_code_c ;;
  }

  dimension: dscorgpkg_company_hq_country_full_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_country_full_name_c ;;
  }

  dimension: dscorgpkg_company_hq_postal_code_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_postal_code_c ;;
  }

  dimension: dscorgpkg_company_hq_state_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_state_c ;;
  }

  dimension: dscorgpkg_company_hq_state_full_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_state_full_name_c ;;
  }

  dimension: dscorgpkg_company_phone_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_phone_c ;;
  }

  dimension: dscorgpkg_conflict_c {
    type: string
    sql: ${TABLE}.dscorgpkg_conflict_c ;;
  }

  dimension: dscorgpkg_deleted_from_discover_org_c {
    type: string
    sql: ${TABLE}.dscorgpkg_deleted_from_discover_org_c ;;
  }

  dimension: dscorgpkg_department_c {
    type: string
    sql: ${TABLE}.dscorgpkg_department_c ;;
  }

  dimension: dscorgpkg_discover_org_company_id_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_company_id_c ;;
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

  dimension: dscorgpkg_email_invalid_c {
    type: yesno
    sql: ${TABLE}.dscorgpkg_email_invalid_c ;;
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

  dimension: dscorgpkg_fortune_rank_c {
    type: string
    sql: ${TABLE}.dscorgpkg_fortune_rank_c ;;
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

  dimension: dscorgpkg_job_function_c {
    type: string
    sql: ${TABLE}.dscorgpkg_job_function_c ;;
  }

  dimension: dscorgpkg_linked_in_url_c {
    type: string
    sql: ${TABLE}.dscorgpkg_linked_in_url_c ;;
  }

  dimension: dscorgpkg_locked_by_user_c {
    type: string
    sql: ${TABLE}.dscorgpkg_locked_by_user_c ;;
  }

  dimension: dscorgpkg_management_level_c {
    type: string
    sql: ${TABLE}.dscorgpkg_management_level_c ;;
  }

  dimension: dscorgpkg_middle_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_middle_name_c ;;
  }

  dimension: dscorgpkg_naics_codes_c {
    type: string
    sql: ${TABLE}.dscorgpkg_naics_codes_c ;;
  }

  dimension: dscorgpkg_nick_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_nick_name_c ;;
  }

  dimension: dscorgpkg_other_phone_c {
    type: string
    sql: ${TABLE}.dscorgpkg_other_phone_c ;;
  }

  dimension: dscorgpkg_ownership_c {
    type: string
    sql: ${TABLE}.dscorgpkg_ownership_c ;;
  }

  dimension: dscorgpkg_reports_to_c {
    type: string
    sql: ${TABLE}.dscorgpkg_reports_to_c ;;
  }

  dimension: dscorgpkg_sic_codes_c {
    type: string
    sql: ${TABLE}.dscorgpkg_sic_codes_c ;;
  }

  dimension: dscorgpkg_twitter_url_c {
    type: string
    sql: ${TABLE}.dscorgpkg_twitter_url_c ;;
  }

  dimension: duplicate_details_c {
    type: string
    sql: ${TABLE}.duplicate_details_c ;;
  }

  dimension: ecustoms_compliance_history_c {
    type: string
    sql: ${TABLE}.ecustoms_compliance_history_c ;;
  }

  dimension_group: ecustoms_im_date_c {
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
    sql: ${TABLE}.ecustoms_im_date_c ;;
  }

  dimension: ecustoms_im_status_c {
    type: string
    sql: ${TABLE}.ecustoms_im_status_c ;;
  }

  dimension_group: ecustoms_rps_date_c {
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
    sql: ${TABLE}.ecustoms_rps_date_c ;;
  }

  dimension: ecustoms_rps_error_c {
    type: string
    sql: ${TABLE}.ecustoms_rps_error_c ;;
  }

  dimension: ecustoms_rps_risk_country_status_c {
    type: string
    sql: ${TABLE}.ecustoms_rps_risk_country_status_c ;;
  }

  dimension: ecustoms_rps_status_c {
    type: string
    sql: ${TABLE}.ecustoms_rps_status_c ;;
  }

  dimension: ecustoms_rpsstring_c {
    type: string
    sql: ${TABLE}.ecustoms_rpsstring_c ;;
  }

  dimension: ecustoms_screening_trigger_c {
    type: yesno
    sql: ${TABLE}.ecustoms_screening_trigger_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: email_bounced {
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
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: engagement_minutes_14_days_c {
    type: number
    sql: ${TABLE}.engagement_minutes_14_days_c ;;
  }

  dimension: engagement_minutes_1_mo_c {
    type: number
    sql: ${TABLE}.engagement_minutes_1_mo_c ;;
  }

  dimension: engagement_minutes_all_time_c {
    type: number
    sql: ${TABLE}.engagement_minutes_all_time_c ;;
  }

  dimension: engagio_department_c {
    type: string
    sql: ${TABLE}.engagio_department_c ;;
  }

  dimension: engagio_engagement_minutes_last_3_months_c {
    type: number
    sql: ${TABLE}.engagio_engagement_minutes_last_3_months_c ;;
  }

  dimension: engagio_engagement_minutes_last_7_days_c {
    type: number
    sql: ${TABLE}.engagio_engagement_minutes_last_7_days_c ;;
  }

  dimension_group: engagio_first_engagement_date_c {
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
    sql: ${TABLE}.engagio_first_engagement_date_c ;;
  }

  dimension: engagio_in_play_c {
    type: yesno
    sql: ${TABLE}.engagio_in_play_c ;;
  }

  dimension: engagio_intent_minutes_last_30_days_c {
    type: number
    sql: ${TABLE}.engagio_intent_minutes_last_30_days_c ;;
  }

  dimension: engagio_last_play_c {
    type: string
    sql: ${TABLE}.engagio_last_play_c ;;
  }

  dimension: engagio_left_company_c {
    type: yesno
    sql: ${TABLE}.engagio_left_company_c ;;
  }

  dimension_group: engagio_match_time_c {
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
    sql: ${TABLE}.engagio_match_time_c ;;
  }

  dimension: engagio_matched_account_annual_revenue_c {
    type: number
    sql: ${TABLE}.engagio_matched_account_annual_revenue_c ;;
  }

  dimension: engagio_matched_account_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_c ;;
  }

  dimension: engagio_matched_account_employees_c {
    type: number
    sql: ${TABLE}.engagio_matched_account_employees_c ;;
  }

  dimension: engagio_matched_account_engage_mins_last_3_months_c {
    type: number
    sql: ${TABLE}.engagio_matched_account_engage_mins_last_3_months_c ;;
  }

  dimension: engagio_matched_account_engage_mins_last_7_days_c {
    type: number
    sql: ${TABLE}.engagio_matched_account_engage_mins_last_7_days_c ;;
  }

  dimension: engagio_matched_account_engagio_status_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_engagio_status_c ;;
  }

  dimension: engagio_matched_account_hq_state_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_hq_state_c ;;
  }

  dimension: engagio_matched_account_industry_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_industry_c ;;
  }

  dimension: engagio_matched_account_name_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_name_c ;;
  }

  dimension: engagio_matched_account_owner_name_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_owner_name_c ;;
  }

  dimension: engagio_matched_account_type_c {
    type: string
    sql: ${TABLE}.engagio_matched_account_type_c ;;
  }

  dimension: engagio_role_c {
    type: string
    sql: ${TABLE}.engagio_role_c ;;
  }

  dimension: enrich_with_clearbit_c {
    type: yesno
    sql: ${TABLE}.enrich_with_clearbit_c ;;
  }

  dimension_group: estimated_close_date_mgtrx_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_close_date_mgtrx_c ;;
  }

  dimension: estimated_deal_amount_mgtrx_c {
    type: number
    sql: ${TABLE}.estimated_deal_amount_mgtrx_c ;;
  }

  dimension_group: fast_track_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fast_track_date_c ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: first_responded_campaign_c {
    type: string
    sql: ${TABLE}.first_responded_campaign_c ;;
  }

  dimension_group: first_responded_campaign_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_responded_campaign_date_c ;;
  }

  dimension: first_responded_campaign_status_c {
    type: string
    sql: ${TABLE}.first_responded_campaign_status_c ;;
  }

  dimension: form_fill_historical_c {
    type: yesno
    sql: ${TABLE}.form_fill_historical_c ;;
  }

  dimension_group: form_fill_most_recent_date_c {
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
    sql: ${TABLE}.form_fill_most_recent_date_c ;;
  }

  dimension: form_page_url_c {
    type: string
    sql: ${TABLE}.form_page_url_c ;;
  }

  dimension: g_2_action_id_c {
    type: string
    sql: ${TABLE}.g_2_action_id_c ;;
  }

  dimension: g_2_document_title_c {
    type: string
    sql: ${TABLE}.g_2_document_title_c ;;
  }

  dimension: g_2_product_c {
    type: string
    sql: ${TABLE}.g_2_product_c ;;
  }

  dimension: g_2_user_action_c {
    type: string
    sql: ${TABLE}.g_2_user_action_c ;;
  }

  dimension: gdpr_compliant_c {
    type: yesno
    sql: ${TABLE}.gdpr_compliant_c ;;
  }

  dimension: gdpr_double_opt_in_c {
    type: yesno
    sql: ${TABLE}.gdpr_double_opt_in_c ;;
  }

  dimension_group: gdpr_double_opt_in_date_c {
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
    sql: ${TABLE}.gdpr_double_opt_in_date_c ;;
  }

  dimension: gdpr_double_opt_in_source_c {
    type: string
    sql: ${TABLE}.gdpr_double_opt_in_source_c ;;
  }

  dimension: gdpr_first_opt_in_c {
    type: yesno
    sql: ${TABLE}.gdpr_first_opt_in_c ;;
  }

  dimension_group: gdpr_first_opt_in_date_c {
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
    sql: ${TABLE}.gdpr_first_opt_in_date_c ;;
  }

  dimension: gdpr_first_opt_in_source_c {
    type: string
    sql: ${TABLE}.gdpr_first_opt_in_source_c ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: google_analytics_client_id_c {
    type: string
    sql: ${TABLE}.google_analytics_client_id_c ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: hashi_corp_cloud_ent_engaged_c {
    type: yesno
    sql: ${TABLE}.hashi_corp_cloud_ent_engaged_c ;;
  }

  dimension: hashi_corp_cloud_ent_engaged_legacy_c {
    type: yesno
    sql: ${TABLE}.hashi_corp_cloud_ent_engaged_legacy_c ;;
  }

  dimension: hashi_corp_cloud_user_c {
    type: yesno
    sql: ${TABLE}.hashi_corp_cloud_user_c ;;
  }

  dimension: hcp_boundary_c {
    type: yesno
    sql: ${TABLE}.hcp_boundary_c ;;
  }

  dimension: hcp_c {
    type: yesno
    sql: ${TABLE}.hcp_c ;;
  }

  dimension: hcp_cluster_count_c {
    type: number
    sql: ${TABLE}.hcp_cluster_count_c ;;
  }

  dimension: hcp_consul_c {
    type: yesno
    sql: ${TABLE}.hcp_consul_c ;;
  }

  dimension: hcp_new_account_created_c {
    type: yesno
    sql: ${TABLE}.hcp_new_account_created_c ;;
  }

  dimension: hcp_nomad_c {
    type: yesno
    sql: ${TABLE}.hcp_nomad_c ;;
  }

  dimension: hcp_sign_up_c {
    type: yesno
    sql: ${TABLE}.hcp_sign_up_c ;;
  }

  dimension_group: hcp_sign_up_date_c {
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
    sql: ${TABLE}.hcp_sign_up_date_c ;;
  }

  dimension: hcp_terraform_c {
    type: yesno
    sql: ${TABLE}.hcp_terraform_c ;;
  }

  dimension: hcp_vault_c {
    type: yesno
    sql: ${TABLE}.hcp_vault_c ;;
  }

  dimension: hcp_vault_cluster_count_c {
    type: number
    sql: ${TABLE}.hcp_vault_cluster_count_c ;;
  }

  dimension: hcp_waypoint_c {
    type: yesno
    sql: ${TABLE}.hcp_waypoint_c ;;
  }

  dimension: hcs_on_azure_c {
    type: yesno
    sql: ${TABLE}.hcs_on_azure_c ;;
  }

  dimension_group: hcs_on_azure_last_login_date_c {
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
    sql: ${TABLE}.hcs_on_azure_last_login_date_c ;;
  }

  dimension: hcs_on_azure_live_clusters_c {
    type: number
    sql: ${TABLE}.hcs_on_azure_live_clusters_c ;;
  }

  dimension: hcs_on_azure_logins_c {
    type: number
    sql: ${TABLE}.hcs_on_azure_logins_c ;;
  }

  dimension: hcs_on_azure_sign_up_c {
    type: yesno
    sql: ${TABLE}.hcs_on_azure_sign_up_c ;;
  }

  dimension_group: hcs_on_azure_sign_up_date_c {
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
    sql: ${TABLE}.hcs_on_azure_sign_up_date_c ;;
  }

  dimension: hcs_on_azure_total_clusters_c {
    type: number
    sql: ${TABLE}.hcs_on_azure_total_clusters_c ;;
  }

  dimension: hot_lead_historical_c {
    type: yesno
    sql: ${TABLE}.hot_lead_historical_c ;;
  }

  dimension_group: hot_lead_most_recent_date_c {
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
    sql: ${TABLE}.hot_lead_most_recent_date_c ;;
  }

  dimension: implied_product_consul_c {
    type: number
    sql: ${TABLE}.implied_product_consul_c ;;
  }

  dimension: implied_product_interest_consul_c {
    type: number
    sql: ${TABLE}.implied_product_interest_consul_c ;;
  }

  dimension: implied_product_interest_nomad_c {
    type: number
    sql: ${TABLE}.implied_product_interest_nomad_c ;;
  }

  dimension: implied_product_interest_terraform_c {
    type: number
    sql: ${TABLE}.implied_product_interest_terraform_c ;;
  }

  dimension: implied_product_interest_vault_c {
    type: number
    sql: ${TABLE}.implied_product_interest_vault_c ;;
  }

  dimension: implied_product_nomad_c {
    type: number
    sql: ${TABLE}.implied_product_nomad_c ;;
  }

  dimension: implied_product_terraform_c {
    type: number
    sql: ${TABLE}.implied_product_terraform_c ;;
  }

  dimension: implied_product_usage_consul_c {
    type: number
    sql: ${TABLE}.implied_product_usage_consul_c ;;
  }

  dimension: implied_product_usage_nomad_c {
    type: number
    sql: ${TABLE}.implied_product_usage_nomad_c ;;
  }

  dimension: implied_product_usage_terrform_c {
    type: number
    sql: ${TABLE}.implied_product_usage_terrform_c ;;
  }

  dimension: implied_product_usage_vault_c {
    type: number
    sql: ${TABLE}.implied_product_usage_vault_c ;;
  }

  dimension: implied_product_vault_c {
    type: number
    sql: ${TABLE}.implied_product_vault_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_spam_c {
    type: string
    sql: ${TABLE}.is_spam_c ;;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
  }

  dimension: junk_stage_count_c {
    type: number
    sql: ${TABLE}.junk_stage_count_c ;;
  }

  dimension_group: junk_stage_date_c {
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
    sql: ${TABLE}.junk_stage_date_c ;;
  }

  dimension: known_stage_count_c {
    type: number
    sql: ${TABLE}.known_stage_count_c ;;
  }

  dimension_group: known_stage_date_c {
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
    sql: ${TABLE}.known_stage_date_c ;;
  }

  dimension: landing_page_url_c {
    type: string
    sql: ${TABLE}.landing_page_url_c ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_fast_track_context_c {
    type: string
    sql: ${TABLE}.last_fast_track_context_c ;;
  }

  dimension: last_hashi_conf_ticket_key_c {
    type: string
    sql: ${TABLE}.last_hashi_conf_ticket_key_c ;;
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

  dimension_group: last_most_interested_implied_product_dat_c {
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
    sql: ${TABLE}.last_most_interested_implied_product_dat_c ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_product_interest_c {
    type: string
    sql: ${TABLE}.last_product_interest_c ;;
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

  dimension: last_trial_key_c {
    type: string
    sql: ${TABLE}.last_trial_key_c ;;
  }

  dimension: last_trial_license_c {
    type: string
    sql: ${TABLE}.last_trial_license_c ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension_group: lead_assigned_date_c {
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
    sql: ${TABLE}.lead_assigned_date_c ;;
  }

  dimension: lead_owner_active_c {
    type: yesno
    sql: ${TABLE}.lead_owner_active_c ;;
  }

  dimension: lead_owner_c {
    type: string
    sql: ${TABLE}.lead_owner_c ;;
  }

  dimension: lead_owner_geo_c {
    type: string
    sql: ${TABLE}.lead_owner_geo_c ;;
  }

  dimension: lead_owner_is_active_c {
    type: yesno
    sql: ${TABLE}.lead_owner_is_active_c ;;
  }

  dimension: lead_owner_job_role_c {
    type: string
    sql: ${TABLE}.lead_owner_job_role_c ;;
  }

  dimension: lead_owner_region_c {
    type: string
    sql: ${TABLE}.lead_owner_region_c ;;
  }

  dimension: lead_owner_role_c {
    type: string
    sql: ${TABLE}.lead_owner_role_c ;;
  }

  dimension: lead_owner_segment_c {
    type: string
    sql: ${TABLE}.lead_owner_segment_c ;;
  }

  dimension: lead_owner_theater_c {
    type: string
    sql: ${TABLE}.lead_owner_theater_c ;;
  }

  dimension: lead_product_c {
    type: string
    sql: ${TABLE}.lead_product_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_bucket_c {
    type: string
    sql: ${TABLE}.lead_source_bucket_c ;;
  }

  dimension: lead_stage_count_c {
    type: number
    sql: ${TABLE}.lead_stage_count_c ;;
  }

  dimension_group: lead_stage_date_c {
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
    sql: ${TABLE}.lead_stage_date_c ;;
  }

  dimension: lead_status_formula_c {
    type: string
    sql: ${TABLE}.lead_status_formula_c ;;
  }

  dimension: lead_territory_c {
    type: string
    sql: ${TABLE}.lead_territory_c ;;
  }

  dimension: lead_type_c {
    type: string
    sql: ${TABLE}.lead_type_c ;;
  }

  dimension: lean_data_a_2_b_account_c {
    type: string
    sql: ${TABLE}.lean_data_a_2_b_account_c ;;
  }

  dimension: lean_data_a_2_b_group_c {
    type: string
    sql: ${TABLE}.lean_data_a_2_b_group_c ;;
  }

  dimension: lean_data_ld_segment_c {
    type: string
    sql: ${TABLE}.lean_data_ld_segment_c ;;
  }

  dimension_group: lean_data_marketing_sys_created_date_c {
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
    sql: ${TABLE}.lean_data_marketing_sys_created_date_c ;;
  }

  dimension: lean_data_matched_account_c {
    type: string
    sql: ${TABLE}.lean_data_matched_account_c ;;
  }

  dimension: lean_data_matched_account_tier_c {
    type: string
    sql: ${TABLE}.lean_data_matched_account_tier_c ;;
  }

  dimension: lean_data_matched_buyer_persona_c {
    type: string
    sql: ${TABLE}.lean_data_matched_buyer_persona_c ;;
  }

  dimension: lean_data_matched_f_1_k_rank_c {
    type: number
    sql: ${TABLE}.lean_data_matched_f_1_k_rank_c ;;
  }

  dimension: lean_data_matched_g_2_k_rank_c {
    type: number
    sql: ${TABLE}.lean_data_matched_g_2_k_rank_c ;;
  }

  dimension: lean_data_matched_lead_c {
    type: string
    sql: ${TABLE}.lean_data_matched_lead_c ;;
  }

  dimension: lean_data_matched_target_account_c {
    type: string
    sql: ${TABLE}.lean_data_matched_target_account_c ;;
  }

  dimension: lean_data_modified_score_c {
    type: number
    sql: ${TABLE}.lean_data_modified_score_c ;;
  }

  dimension: lean_data_reporting_matched_account_c {
    type: string
    sql: ${TABLE}.lean_data_reporting_matched_account_c ;;
  }

  dimension_group: lean_data_reporting_timestamp_c {
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
    sql: ${TABLE}.lean_data_reporting_timestamp_c ;;
  }

  dimension: lean_data_routed_c {
    type: yesno
    sql: ${TABLE}.lean_data_routed_c ;;
  }

  dimension: lean_data_router_status_c {
    type: string
    sql: ${TABLE}.lean_data_router_status_c ;;
  }

  dimension: lean_data_routing_action_c {
    type: string
    sql: ${TABLE}.lean_data_routing_action_c ;;
  }

  dimension: lean_data_routing_status_c {
    type: string
    sql: ${TABLE}.lean_data_routing_status_c ;;
  }

  dimension: lean_data_search_c {
    type: string
    sql: ${TABLE}.lean_data_search_c ;;
  }

  dimension: lean_data_search_index_c {
    type: string
    sql: ${TABLE}.lean_data_search_index_c ;;
  }

  dimension: lean_data_status_info_c {
    type: string
    sql: ${TABLE}.lean_data_status_info_c ;;
  }

  dimension: lean_data_tag_c {
    type: string
    sql: ${TABLE}.lean_data_tag_c ;;
  }

  dimension: lid_linked_in_company_id_c {
    type: string
    sql: ${TABLE}.lid_linked_in_company_id_c ;;
  }

  dimension: lid_linked_in_member_token_c {
    type: string
    sql: ${TABLE}.lid_linked_in_member_token_c ;;
  }

  dimension: lifecycle_stage_c {
    type: string
    sql: ${TABLE}.lifecycle_stage_c ;;
  }

  dimension: lifecycle_stage_legacy_c {
    type: string
    sql: ${TABLE}.lifecycle_stage_legacy_c ;;
  }

  dimension: litmos_current_generators_c {
    type: string
    sql: ${TABLE}.litmos_current_generators_c ;;
  }

  dimension: litmos_numberof_locations_c {
    type: number
    sql: ${TABLE}.litmos_numberof_locations_c ;;
  }

  dimension: litmos_primary_c {
    type: string
    sql: ${TABLE}.litmos_primary_c ;;
  }

  dimension: litmos_product_interest_c {
    type: string
    sql: ${TABLE}.litmos_product_interest_c ;;
  }

  dimension: litmos_siccode_c {
    type: string
    sql: ${TABLE}.litmos_siccode_c ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: madison_logic_content_c {
    type: string
    sql: ${TABLE}.madison_logic_content_c ;;
  }

  dimension: manually_route_c {
    type: yesno
    sql: ${TABLE}.manually_route_c ;;
  }

  dimension: marketing_activity_1_mo_c {
    type: number
    sql: ${TABLE}.marketing_activity_1_mo_c ;;
  }

  dimension: marketing_activity_c {
    type: number
    sql: ${TABLE}.marketing_activity_c ;;
  }

  dimension: marketing_channel_ft_c {
    type: string
    sql: ${TABLE}.marketing_channel_ft_c ;;
  }

  dimension: marketing_channel_lc_c {
    type: string
    sql: ${TABLE}.marketing_channel_lc_c ;;
  }

  dimension: marketing_prospect_c {
    type: yesno
    sql: ${TABLE}.marketing_prospect_c ;;
  }

  dimension_group: marketing_prospect_qualification_date_c {
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
    sql: ${TABLE}.marketing_prospect_qualification_date_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: matched_18_digit_account_id_c {
    type: string
    sql: ${TABLE}.matched_18_digit_account_id_c ;;
  }

  dimension: matched_account_c {
    type: string
    sql: ${TABLE}.matched_account_c ;;
  }

  dimension: matched_account_owner_c {
    type: string
    sql: ${TABLE}.matched_account_owner_c ;;
  }

  dimension: matched_account_type_c {
    type: string
    sql: ${TABLE}.matched_account_type_c ;;
  }

  dimension: message_c {
    type: string
    sql: ${TABLE}.message_c ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension_group: mkto_71_acquisition_date_c {
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
    sql: ${TABLE}.mkto_71_acquisition_date_c ;;
  }

  dimension: mkto_71_acquisition_program_c {
    type: string
    sql: ${TABLE}.mkto_71_acquisition_program_c ;;
  }

  dimension: mkto_71_lead_score_c {
    type: number
    sql: ${TABLE}.mkto_71_lead_score_c ;;
  }

  dimension: mkto_score_prgm_status_most_recent_c {
    type: string
    sql: ${TABLE}.mkto_score_prgm_status_most_recent_c ;;
  }

  dimension: mkto_scoring_milestone_most_recent_c {
    type: string
    sql: ${TABLE}.mkto_scoring_milestone_most_recent_c ;;
  }

  dimension: mkto_scoring_program_most_recent_c {
    type: string
    sql: ${TABLE}.mkto_scoring_program_most_recent_c ;;
  }

  dimension: mkto_si_add_to_marketo_campaign_c {
    type: string
    sql: ${TABLE}.mkto_si_add_to_marketo_campaign_c ;;
  }

  dimension_group: mkto_si_hide_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.mkto_si_hide_date_c ;;
  }

  dimension: mkto_si_last_interesting_moment_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_c ;;
  }

  dimension_group: mkto_si_last_interesting_moment_date_c {
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
    sql: ${TABLE}.mkto_si_last_interesting_moment_date_c ;;
  }

  dimension: mkto_si_last_interesting_moment_desc_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_desc_c ;;
  }

  dimension: mkto_si_last_interesting_moment_source_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_source_c ;;
  }

  dimension: mkto_si_last_interesting_moment_type_c {
    type: string
    sql: ${TABLE}.mkto_si_last_interesting_moment_type_c ;;
  }

  dimension: mkto_si_msicontact_id_c {
    type: string
    sql: ${TABLE}.mkto_si_msicontact_id_c ;;
  }

  dimension: mkto_si_priority_c {
    type: number
    sql: ${TABLE}.mkto_si_priority_c ;;
  }

  dimension: mkto_si_relative_score_c {
    type: string
    sql: ${TABLE}.mkto_si_relative_score_c ;;
  }

  dimension: mkto_si_relative_score_value_c {
    type: number
    sql: ${TABLE}.mkto_si_relative_score_value_c ;;
  }

  dimension: mkto_si_urgency_c {
    type: string
    sql: ${TABLE}.mkto_si_urgency_c ;;
  }

  dimension: mkto_si_urgency_value_c {
    type: number
    sql: ${TABLE}.mkto_si_urgency_value_c ;;
  }

  dimension: mkto_si_view_in_marketo_c {
    type: string
    sql: ${TABLE}.mkto_si_view_in_marketo_c ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: most_interested_implied_product_c {
    type: string
    sql: ${TABLE}.most_interested_implied_product_c ;;
  }

  dimension: most_recent_activity_c {
    type: string
    sql: ${TABLE}.most_recent_activity_c ;;
  }

  dimension: most_recent_lead_source_c {
    type: string
    sql: ${TABLE}.most_recent_lead_source_c ;;
  }

  dimension: most_recent_responded_campaign_c {
    type: string
    sql: ${TABLE}.most_recent_responded_campaign_c ;;
  }

  dimension_group: most_recent_responded_campaign_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.most_recent_responded_campaign_date_c ;;
  }

  dimension: most_recent_responded_campaign_status_c {
    type: string
    sql: ${TABLE}.most_recent_responded_campaign_status_c ;;
  }

  dimension: mql_behavior_score_c {
    type: number
    sql: ${TABLE}.mql_behavior_score_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: named_account_fast_track_c {
    type: yesno
    sql: ${TABLE}.named_account_fast_track_c ;;
  }

  dimension: node_count_c {
    type: string
    sql: ${TABLE}.node_count_c ;;
  }

  dimension: nomad_c {
    type: yesno
    sql: ${TABLE}.nomad_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: nurture_block_c {
    type: yesno
    sql: ${TABLE}.nurture_block_c ;;
  }

  dimension_group: original_churn_stage_date_c {
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
    sql: ${TABLE}.original_churn_stage_date_c ;;
  }

  dimension_group: original_closed_lost_stage_date_c {
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
    sql: ${TABLE}.original_closed_lost_stage_date_c ;;
  }

  dimension_group: original_junk_stage_date_c {
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
    sql: ${TABLE}.original_junk_stage_date_c ;;
  }

  dimension_group: original_known_stage_date_c {
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
    sql: ${TABLE}.original_known_stage_date_c ;;
  }

  dimension_group: original_lead_stage_date_c {
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
    sql: ${TABLE}.original_lead_stage_date_c ;;
  }

  dimension_group: original_pre_sales_stage_date_c {
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
    sql: ${TABLE}.original_pre_sales_stage_date_c ;;
  }

  dimension_group: original_qualified_stage_date_c {
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
    sql: ${TABLE}.original_qualified_stage_date_c ;;
  }

  dimension_group: original_sal_stage_date_c {
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
    sql: ${TABLE}.original_sal_stage_date_c ;;
  }

  dimension_group: original_unqualified_stage_date_c {
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
    sql: ${TABLE}.original_unqualified_stage_date_c ;;
  }

  dimension_group: original_won_stage_date_c {
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
    sql: ${TABLE}.original_won_stage_date_c ;;
  }

  dimension_group: original_working_stage_date_c {
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
    sql: ${TABLE}.original_working_stage_date_c ;;
  }

  dimension: oss_adoption_c {
    type: string
    sql: ${TABLE}.oss_adoption_c ;;
  }

  dimension: out_of_sla_c {
    type: yesno
    sql: ${TABLE}.out_of_sla_c ;;
  }

  dimension_group: out_of_sla_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.out_of_sla_date_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_job_role_c {
    type: string
    sql: ${TABLE}.owner_job_role_c ;;
  }

  dimension: owner_region_c {
    type: string
    sql: ${TABLE}.owner_region_c ;;
  }

  dimension: owner_territory_c {
    type: string
    sql: ${TABLE}.owner_territory_c ;;
  }

  dimension: owner_theater_geo_segment_c {
    type: string
    sql: ${TABLE}.owner_theater_geo_segment_c ;;
  }

  dimension: partner_contact_mgtrx_c {
    type: string
    sql: ${TABLE}.partner_contact_mgtrx_c ;;
  }

  dimension: partner_deal_reg_status_c {
    type: string
    sql: ${TABLE}.partner_deal_reg_status_c ;;
  }

  dimension: partner_name_c {
    type: string
    sql: ${TABLE}.partner_name_c ;;
  }

  dimension: partner_product_interest_c {
    type: string
    sql: ${TABLE}.partner_product_interest_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: platform_org_name_c {
    type: string
    sql: ${TABLE}.platform_org_name_c ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension_group: pql_most_recent_date_c {
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
    sql: ${TABLE}.pql_most_recent_date_c ;;
  }

  dimension: pql_product_c {
    type: string
    sql: ${TABLE}.pql_product_c ;;
  }

  dimension_group: pql_qualification_date_hcp_consul_c {
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
    sql: ${TABLE}.pql_qualification_date_hcp_consul_c ;;
  }

  dimension_group: pql_qualification_date_hcp_vault_c {
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
    sql: ${TABLE}.pql_qualification_date_hcp_vault_c ;;
  }

  dimension_group: pql_qualification_date_tfcb_c {
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
    sql: ${TABLE}.pql_qualification_date_tfcb_c ;;
  }

  dimension: pre_sales_stage_count_c {
    type: number
    sql: ${TABLE}.pre_sales_stage_count_c ;;
  }

  dimension_group: pre_sales_stage_date_c {
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
    sql: ${TABLE}.pre_sales_stage_date_c ;;
  }

  dimension: primary_infrastructure_provider_c {
    type: string
    sql: ${TABLE}.primary_infrastructure_provider_c ;;
  }

  dimension: priority_sales_play_c {
    type: string
    sql: ${TABLE}.priority_sales_play_c ;;
  }

  dimension: product_qualified_lead_historical_c {
    type: yesno
    sql: ${TABLE}.product_qualified_lead_historical_c ;;
  }

  dimension_group: push_to_sales_hcp_consul_c {
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
    sql: ${TABLE}.push_to_sales_hcp_consul_c ;;
  }

  dimension_group: push_to_sales_hcp_vault_c {
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
    sql: ${TABLE}.push_to_sales_hcp_vault_c ;;
  }

  dimension_group: push_to_sales_tfcb_c {
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
    sql: ${TABLE}.push_to_sales_tfcb_c ;;
  }

  dimension: qualified_stage_count_c {
    type: number
    sql: ${TABLE}.qualified_stage_count_c ;;
  }

  dimension_group: qualified_stage_date_c {
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
    sql: ${TABLE}.qualified_stage_date_c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: re_assignment_filter_c {
    type: yesno
    sql: ${TABLE}.re_assignment_filter_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: registered_partner_c {
    type: string
    sql: ${TABLE}.registered_partner_c ;;
  }

  dimension: rejection_reason_c {
    type: string
    sql: ${TABLE}.rejection_reason_c ;;
  }

  dimension: rejection_reason_notes_c {
    type: string
    sql: ${TABLE}.rejection_reason_notes_c ;;
  }

  dimension: review_status_mgtrx_c {
    type: string
    sql: ${TABLE}.review_status_mgtrx_c ;;
  }

  dimension: ring_lead_dms_status_c {
    type: string
    sql: ${TABLE}.ring_lead_dms_status_c ;;
  }

  dimension: sal_stage_count_c {
    type: number
    sql: ${TABLE}.sal_stage_count_c ;;
  }

  dimension_group: sal_stage_date_c {
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
    sql: ${TABLE}.sal_stage_date_c ;;
  }

  dimension: sales_activity_1_mo_c {
    type: number
    sql: ${TABLE}.sales_activity_1_mo_c ;;
  }

  dimension: sales_activity_c {
    type: number
    sql: ${TABLE}.sales_activity_c ;;
  }

  dimension: sales_loft_1_active_lead_c {
    type: number
    sql: ${TABLE}.sales_loft_1_active_lead_c ;;
  }

  dimension: sales_loft_1_most_recent_cadence_name_c {
    type: string
    sql: ${TABLE}.sales_loft_1_most_recent_cadence_name_c ;;
  }

  dimension_group: sales_loft_1_most_recent_cadence_next_step_due_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_loft_1_most_recent_cadence_next_step_due_date_c ;;
  }

  dimension: sales_loft_1_most_recent_last_completed_step_c {
    type: number
    sql: ${TABLE}.sales_loft_1_most_recent_last_completed_step_c ;;
  }

  dimension: sales_loft_last_completed_step_c {
    type: number
    sql: ${TABLE}.sales_loft_last_completed_step_c ;;
  }

  dimension: sales_loft_most_recent_cadence_id_c {
    type: string
    sql: ${TABLE}.sales_loft_most_recent_cadence_id_c ;;
  }

  dimension: sales_loft_most_recent_cadence_name_c {
    type: string
    sql: ${TABLE}.sales_loft_most_recent_cadence_name_c ;;
  }

  dimension: sales_loft_next_step_c {
    type: number
    sql: ${TABLE}.sales_loft_next_step_c ;;
  }

  dimension_group: sales_loft_next_step_due_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_loft_next_step_due_date_c ;;
  }

  dimension: sales_loft_person_stage_c {
    type: string
    sql: ${TABLE}.sales_loft_person_stage_c ;;
  }

  dimension: sales_ready_reason_c {
    type: string
    sql: ${TABLE}.sales_ready_reason_c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: se_office_hours_result_c {
    type: string
    sql: ${TABLE}.se_office_hours_result_c ;;
  }

  dimension: se_office_hours_result_detail_c {
    type: string
    sql: ${TABLE}.se_office_hours_result_detail_c ;;
  }

  dimension: seniority_c {
    type: string
    sql: ${TABLE}.seniority_c ;;
  }

  dimension: signed_up_for_newsletter_c {
    type: yesno
    sql: ${TABLE}.signed_up_for_newsletter_c ;;
  }

  dimension: sourcing_partner_contact_c {
    type: string
    sql: ${TABLE}.sourcing_partner_contact_c ;;
  }

  dimension: spla_that_mailing_address_c {
    type: string
    sql: ${TABLE}.spla_that_mailing_address_c ;;
  }

  dimension: splash_that_postal_code_c {
    type: string
    sql: ${TABLE}.splash_that_postal_code_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension_group: submitted_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submitted_date_c ;;
  }

  dimension: subs_consul_marketing_c {
    type: yesno
    sql: ${TABLE}.subs_consul_marketing_c ;;
  }

  dimension_group: subs_consul_marketing_opt_in_date_c {
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
    sql: ${TABLE}.subs_consul_marketing_opt_in_date_c ;;
  }

  dimension_group: subs_consul_marketing_opt_out_date_c {
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
    sql: ${TABLE}.subs_consul_marketing_opt_out_date_c ;;
  }

  dimension: subs_consul_updates_c {
    type: yesno
    sql: ${TABLE}.subs_consul_updates_c ;;
  }

  dimension_group: subs_consul_updates_opt_in_date_c {
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
    sql: ${TABLE}.subs_consul_updates_opt_in_date_c ;;
  }

  dimension_group: subs_consul_updates_opt_out_date_c {
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
    sql: ${TABLE}.subs_consul_updates_opt_out_date_c ;;
  }

  dimension: subs_nomad_marketing_c {
    type: yesno
    sql: ${TABLE}.subs_nomad_marketing_c ;;
  }

  dimension_group: subs_nomad_marketing_opt_in_date_c {
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
    sql: ${TABLE}.subs_nomad_marketing_opt_in_date_c ;;
  }

  dimension_group: subs_nomad_marketing_opt_out_date_c {
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
    sql: ${TABLE}.subs_nomad_marketing_opt_out_date_c ;;
  }

  dimension: subs_nomad_updates_c {
    type: yesno
    sql: ${TABLE}.subs_nomad_updates_c ;;
  }

  dimension_group: subs_nomad_updates_opt_in_date_c {
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
    sql: ${TABLE}.subs_nomad_updates_opt_in_date_c ;;
  }

  dimension_group: subs_nomad_updates_opt_out_date_c {
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
    sql: ${TABLE}.subs_nomad_updates_opt_out_date_c ;;
  }

  dimension: subs_packer_marketing_c {
    type: yesno
    sql: ${TABLE}.subs_packer_marketing_c ;;
  }

  dimension_group: subs_packer_marketing_opt_in_date_c {
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
    sql: ${TABLE}.subs_packer_marketing_opt_in_date_c ;;
  }

  dimension_group: subs_packer_marketing_opt_out_date_c {
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
    sql: ${TABLE}.subs_packer_marketing_opt_out_date_c ;;
  }

  dimension: subs_packer_updates_c {
    type: yesno
    sql: ${TABLE}.subs_packer_updates_c ;;
  }

  dimension_group: subs_packer_updates_opt_in_date_c {
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
    sql: ${TABLE}.subs_packer_updates_opt_in_date_c ;;
  }

  dimension_group: subs_packer_updates_opt_out_date_c {
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
    sql: ${TABLE}.subs_packer_updates_opt_out_date_c ;;
  }

  dimension: subs_terraform_mktg_c {
    type: yesno
    sql: ${TABLE}.subs_terraform_mktg_c ;;
  }

  dimension_group: subs_terraform_mktg_opt_in_date_c {
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
    sql: ${TABLE}.subs_terraform_mktg_opt_in_date_c ;;
  }

  dimension_group: subs_terraform_mktg_opt_out_date_c {
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
    sql: ${TABLE}.subs_terraform_mktg_opt_out_date_c ;;
  }

  dimension: subs_vagrant_marketing_c {
    type: yesno
    sql: ${TABLE}.subs_vagrant_marketing_c ;;
  }

  dimension_group: subs_vagrant_marketing_opt_in_date_c {
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
    sql: ${TABLE}.subs_vagrant_marketing_opt_in_date_c ;;
  }

  dimension_group: subs_vagrant_marketing_opt_out_date_c {
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
    sql: ${TABLE}.subs_vagrant_marketing_opt_out_date_c ;;
  }

  dimension: subs_vagrant_updates_c {
    type: yesno
    sql: ${TABLE}.subs_vagrant_updates_c ;;
  }

  dimension_group: subs_vagrant_updates_opt_in_date_c {
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
    sql: ${TABLE}.subs_vagrant_updates_opt_in_date_c ;;
  }

  dimension_group: subs_vagrant_updates_opt_out_date_c {
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
    sql: ${TABLE}.subs_vagrant_updates_opt_out_date_c ;;
  }

  dimension: subs_vault_marketing_c {
    type: yesno
    sql: ${TABLE}.subs_vault_marketing_c ;;
  }

  dimension_group: subs_vault_marketing_opt_in_date_c {
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
    sql: ${TABLE}.subs_vault_marketing_opt_in_date_c ;;
  }

  dimension_group: subs_vault_marketing_opt_out_date_c {
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
    sql: ${TABLE}.subs_vault_marketing_opt_out_date_c ;;
  }

  dimension: subscription_hc_general_updates_c {
    type: yesno
    sql: ${TABLE}.subscription_hc_general_updates_c ;;
  }

  dimension_group: subscription_hc_general_updates_opt_in_c {
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
    sql: ${TABLE}.subscription_hc_general_updates_opt_in_c ;;
  }

  dimension_group: subscription_hc_general_updates_opt_ou_c {
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
    sql: ${TABLE}.subscription_hc_general_updates_opt_ou_c ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
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

  dimension: terraform_c {
    type: yesno
    sql: ${TABLE}.terraform_c ;;
  }

  dimension_group: tfc_last_login_date_c {
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
    sql: ${TABLE}.tfc_last_login_date_c ;;
  }

  dimension: tfc_logins_c {
    type: number
    sql: ${TABLE}.tfc_logins_c ;;
  }

  dimension: tfc_org_owner_creator_c {
    type: yesno
    sql: ${TABLE}.tfc_org_owner_creator_c ;;
  }

  dimension: tfc_runs_c {
    type: number
    sql: ${TABLE}.tfc_runs_c ;;
  }

  dimension: tfc_sign_up_c {
    type: yesno
    sql: ${TABLE}.tfc_sign_up_c ;;
  }

  dimension_group: tfc_sign_up_date_c {
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
    sql: ${TABLE}.tfc_sign_up_date_c ;;
  }

  dimension: tfc_workspaces_c {
    type: number
    sql: ${TABLE}.tfc_workspaces_c ;;
  }

  dimension: timeline_12_months_c {
    type: string
    sql: ${TABLE}.timeline_12_months_c ;;
  }

  dimension: timeline_details_c {
    type: string
    sql: ${TABLE}.timeline_details_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: touchpoint_date_ft_c {
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
    sql: ${TABLE}.touchpoint_date_ft_c ;;
  }

  dimension_group: touchpoint_date_lc_c {
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
    sql: ${TABLE}.touchpoint_date_lc_c ;;
  }

  dimension_group: touchpoint_date_simple_ft_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.touchpoint_date_simple_ft_c ;;
  }

  dimension_group: touchpoint_date_simple_lc_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.touchpoint_date_simple_lc_c ;;
  }

  dimension: touchpoint_source_ft_c {
    type: string
    sql: ${TABLE}.touchpoint_source_ft_c ;;
  }

  dimension: touchpoint_source_lc_c {
    type: string
    sql: ${TABLE}.touchpoint_source_lc_c ;;
  }

  dimension: transacting_partner_c {
    type: string
    sql: ${TABLE}.transacting_partner_c ;;
  }

  dimension: unqualified_reason_c {
    type: string
    sql: ${TABLE}.unqualified_reason_c ;;
  }

  dimension: unqualified_stage_count_c {
    type: number
    sql: ${TABLE}.unqualified_stage_count_c ;;
  }

  dimension_group: unqualified_stage_date_c {
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
    sql: ${TABLE}.unqualified_stage_date_c ;;
  }

  dimension: user_count_c {
    type: string
    sql: ${TABLE}.user_count_c ;;
  }

  dimension: user_ip_address_c {
    type: string
    sql: ${TABLE}.user_ip_address_c ;;
  }

  dimension: utm_campaign_c {
    type: string
    sql: ${TABLE}.utm_campaign_c ;;
  }

  dimension: utm_cid_c {
    type: string
    sql: ${TABLE}.utm_cid_c ;;
  }

  dimension: utm_content_c {
    type: string
    sql: ${TABLE}.utm_content_c ;;
  }

  dimension: utm_medium_c {
    type: string
    sql: ${TABLE}.utm_medium_c ;;
  }

  dimension: utm_offer_c {
    type: string
    sql: ${TABLE}.utm_offer_c ;;
  }

  dimension: utm_source_c {
    type: string
    sql: ${TABLE}.utm_source_c ;;
  }

  dimension: utm_term_c {
    type: string
    sql: ${TABLE}.utm_term_c ;;
  }

  dimension: vault_c {
    type: yesno
    sql: ${TABLE}.vault_c ;;
  }

  dimension: waypoint_c {
    type: yesno
    sql: ${TABLE}.waypoint_c ;;
  }

  dimension: webcast_activity_activity_type_c {
    type: string
    sql: ${TABLE}.webcast_activity_activity_type_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: won_stage_count_c {
    type: number
    sql: ${TABLE}.won_stage_count_c ;;
  }

  dimension_group: won_stage_date_c {
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
    sql: ${TABLE}.won_stage_date_c ;;
  }

  dimension: working_stage_count_c {
    type: number
    sql: ${TABLE}.working_stage_count_c ;;
  }

  dimension_group: working_stage_date_c {
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
    sql: ${TABLE}.working_stage_date_c ;;
  }

  dimension: x_18_digit_lead_id_c {
    type: string
    sql: ${TABLE}.x_18_digit_lead_id_c ;;
  }

  dimension: zendesk_create_in_zendesk_c {
    type: yesno
    sql: ${TABLE}.zendesk_create_in_zendesk_c ;;
  }

  dimension: zendesk_is_created_updated_flag_c {
    type: yesno
    sql: ${TABLE}.zendesk_is_created_updated_flag_c ;;
  }

  dimension: zendesk_notes_c {
    type: string
    sql: ${TABLE}.zendesk_notes_c ;;
  }

  dimension: zendesk_result_c {
    type: string
    sql: ${TABLE}.zendesk_result_c ;;
  }

  dimension: zendesk_tags_c {
    type: string
    sql: ${TABLE}.zendesk_tags_c ;;
  }

  dimension: zendesk_zendesk_id_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_id_c ;;
  }

  dimension: zendesk_zendesk_old_tags_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_old_tags_c ;;
  }

  dimension: zendesk_zendesk_outof_sync_c {
    type: yesno
    sql: ${TABLE}.zendesk_zendesk_outof_sync_c ;;
  }

  dimension_group: zoom_info_notice_provided_date_c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.zoom_info_notice_provided_date_c ;;
  }

  dimension: zoom_info_notice_provided_date_text_c {
    type: string
    sql: ${TABLE}.zoom_info_notice_provided_date_text_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, status, name, middle_name, first_name, last_name]
  }
}
