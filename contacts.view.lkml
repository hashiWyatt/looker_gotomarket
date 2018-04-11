view: contacts {
  sql_table_name: salesforce.contacts ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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

  dimension: certification_c {
    type: yesno
    sql: ${TABLE}.certification_c ;;
  }

  dimension: certification_product_c {
    type: string
    sql: ${TABLE}.certification_product_c ;;
  }

  dimension: community_role_mgtrx_c {
    type: string
    sql: ${TABLE}.community_role_mgtrx_c ;;
  }

  dimension: community_user_mgtrx_c {
    type: yesno
    sql: ${TABLE}.community_user_mgtrx_c ;;
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

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
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

  dimension: dscorgpkg_job_function_c {
    type: string
    sql: ${TABLE}.dscorgpkg_job_function_c ;;
  }

  dimension: dscorgpkg_linked_in_url_c {
    type: string
    sql: ${TABLE}.dscorgpkg_linked_in_url_c ;;
  }

  dimension: dscorgpkg_management_level_c {
    type: string
    sql: ${TABLE}.dscorgpkg_management_level_c ;;
  }

  dimension: dscorgpkg_reports_to_c {
    type: string
    sql: ${TABLE}.dscorgpkg_reports_to_c ;;
  }

  dimension: dscorgpkg_twitter_url_c {
    type: string
    sql: ${TABLE}.dscorgpkg_twitter_url_c ;;
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

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name_internal_c {
    type: string
    sql: ${TABLE}.full_name_internal_c ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.is_email_bounced ;;
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
  }

  dimension: mailing_country {
    type: string
    sql: ${TABLE}.mailing_country ;;
  }

  dimension: mailing_postal_code {
    type: string
    sql: ${TABLE}.mailing_postal_code ;;
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}.mailing_state ;;
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
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

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
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

  dimension: reports_to_id {
    type: string
    sql: ${TABLE}.reports_to_id ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: status_c {
    type: string
    sql: ${TABLE}.status_c ;;
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

  dimension: zendesk_zendesk_id_c {
    type: string
    sql: ${TABLE}.zendesk_zendesk_id_c ;;
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
      middle_name,
      last_name,
      first_name,
      name,
      accounts.name,
      accounts.id,
      campaign_members.count,
      opportunity_contact_role.count
    ]
  }
}
