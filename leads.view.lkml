view: leads {
  sql_table_name: salesforce.leads ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: accept_terms_mgtrx_c {
    type: yesno
    sql: ${TABLE}.accept_terms_mgtrx_c ;;
  }

  dimension: campaign_id_c {
    type: string
    sql: ${TABLE}.campaign_id_c ;;
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

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: days_since_last_activity_c {
    type: number
    sql: ${TABLE}.days_since_last_activity_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dscorgpkg_company_hq_address_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_address_c ;;
  }

  dimension: dscorgpkg_company_hq_city_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_city_c ;;
  }

  dimension: dscorgpkg_company_hq_country_full_name_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_country_full_name_c ;;
  }

  dimension: dscorgpkg_company_hq_postal_code_c {
    type: string
    sql: ${TABLE}.dscorgpkg_company_hq_postal_code_c ;;
  }

  dimension: dscorgpkg_conflict_c {
    type: string
    sql: ${TABLE}.dscorgpkg_conflict_c ;;
  }

  dimension: dscorgpkg_deleted_from_discover_org_c {
    type: string
    sql: ${TABLE}.dscorgpkg_deleted_from_discover_org_c ;;
  }

  dimension: dscorgpkg_discover_org_company_id_c {
    type: string
    sql: ${TABLE}.dscorgpkg_discover_org_company_id_c ;;
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

  dimension: dscorgpkg_itorg_chart_c {
    type: string
    sql: ${TABLE}.dscorgpkg_itorg_chart_c ;;
  }

  dimension: dscorgpkg_other_phone_c {
    type: string
    sql: ${TABLE}.dscorgpkg_other_phone_c ;;
  }

  dimension: dscorgpkg_reports_to_c {
    type: string
    sql: ${TABLE}.dscorgpkg_reports_to_c ;;
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

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: form_page_url_c {
    type: string
    sql: ${TABLE}.form_page_url_c ;;
  }

  dimension: google_analytics_client_id_c {
    type: string
    sql: ${TABLE}.google_analytics_client_id_c ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
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

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: landing_page_url_c {
    type: string
    sql: ${TABLE}.landing_page_url_c ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension_group: lead_stage_date {
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
    sql: ${TABLE}.lead_stage_date_c - interval '7 hours' ;;
  }

  dimension: lead_owner_active {
    type: yesno
    sql: ${TABLE}.lead_owner_active_c ;;
  }

  dimension: lead_product_c {
    type: string
    sql: ${TABLE}.lead_product_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_type_c {
    type: string
    sql: ${TABLE}.lead_type_c ;;
  }

  dimension: lead_owner {
    type: string
    sql: ${TABLE}.lead_owner_c ;;
  }

  dimension: lead_owner_job_role {
    type: string
    sql: ${TABLE}.lead_owner_job_role_c ;;
  }

  dimension: lead_owner_region {
    type: string
    sql: ${TABLE}.lead_owner_region_c ;;
  }

  dimension: lifecycle_stage_c {
    type: string
    sql: ${TABLE}.lifecycle_stage_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: node_count_c {
    type: string
    sql: ${TABLE}.node_count_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: oss_adoption_c {
    type: string
    sql: ${TABLE}.oss_adoption_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_job_role {
    type: string
    sql: ${TABLE}.owner_job_role_c ;;
  }

  dimension: owner_territory {
    type: string
    sql: ${TABLE}.owner_territory_c ;;
  }

  dimension: out_of_sla {
    type: yesno
    sql: ${TABLE}.out_of_sla_c ;;
  }

  dimension_group: out_of_sla_date_c {
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
    sql: ${TABLE}.out_of_sla_date_c ;;
  }

  dimension: partner_contact_mgtrx_c {
    type: string
    sql: ${TABLE}.partner_contact_mgtrx_c ;;
  }

  dimension: partner_name_c {
    type: string
    sql: ${TABLE}.partner_name_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: primary_infrastructure_provider_c {
    type: string
    sql: ${TABLE}.primary_infrastructure_provider_c ;;
  }

  dimension_group: qualified_stage_date {
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

  dimension_group: SAL_stage_date {
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
    sql: ${TABLE}.SAL_stage_date_c - interval '7 hours' ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: unqualified_reason_c {
    type: string
    sql: ${TABLE}.unqualified_reason_c ;;
  }

  dimension_group: unqualified_stage_date {
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
    sql: ${TABLE}.unqualified_stage_date_c - interval '7 hours' ;;
  }

  dimension: user_count_c {
    type: string
    sql: ${TABLE}.user_count_c ;;
  }

  dimension: utm_campaign_c {
    type: string
    sql: ${TABLE}.utm_campaign_c ;;
  }

  dimension: utm_content_c {
    type: string
    sql: ${TABLE}.utm_content_c ;;
  }

  dimension: utm_medium_c {
    type: string
    sql: ${TABLE}.utm_medium_c ;;
  }

  dimension: utm_source_c {
    type: string
    sql: ${TABLE}.utm_source_c ;;
  }

  dimension: utm_term_c {
    type: string
    sql: ${TABLE}.utm_term_c ;;
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

  dimension: zendesk_organization_c {
    type: string
    sql: ${TABLE}.zendesk_organization_c ;;
  }

  dimension: zendesk_result_c {
    type: string
    sql: ${TABLE}.zendesk_result_c ;;
  }

  dimension: zendesk_zendesk_id_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_id_c ;;
  }

  dimension: zendesk_zendesk_outof_sync_c {
    type: yesno
    sql: ${TABLE}.zendesk_zendesk_outof_sync_c ;;
  }

  dimension:  conversion_time_days {
    type: number
    sql: DATEDIFF(day, ${created_raw}, ${converted_raw}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      company,
      name,
      first_name,
      last_name,
      campaign_members.count,
      lead_owner,
      lead_owner_job_role,
      lead_owner_region
    ]
  }
}
