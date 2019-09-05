view: opportunities {
  sql_table_name: salesforce.opportunities ;;

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

  dimension: account_manager_c {
    type: string
    sql: ${TABLE}.account_manager_c ;;
  }

  dimension: account_type_c {
    type: string
    sql: ${TABLE}.account_type_c ;;
  }

  dimension: accounting_contact_c {
    type: string
    sql: ${TABLE}.accounting_contact_c ;;
  }

  dimension: accounting_contact_email_c {
    type: string
    sql: ${TABLE}.accounting_contact_email_c ;;
  }

  dimension: agreement_type_c {
    type: string
    sql: ${TABLE}.agreement_type_c ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount::numeric ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: approved_by_c {
    type: string
    sql: ${TABLE}.approved_by_c ;;
  }

  dimension: authority_decision_maker_c {
    type: string
    sql: ${TABLE}.authority_decision_maker_c ;;
  }

  dimension: budget_confirmed_c {
    type: yesno
    sql: ${TABLE}.budget_confirmed_c ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: champion_c {
    type: string
    sql: ${TABLE}.champion_c ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,fiscal_quarter,fiscal_quarter_of_year,fiscal_year,fiscal_month_num
    ]
    sql: ${TABLE}.close_date ;;
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
    sql: ${TABLE}.created_date - interval '7 hours' ;;
  }

  dimension: current_acv_c {
    type: string
    sql: ${TABLE}.current_acv_c ;;
  }

  dimension: days_legal_negotiations_start_and_end_c {
    type: number
    sql: ${TABLE}.days_legal_negotiations_start_and_end_c ;;
  }

  dimension: days_since_legal_docs_sent_c {
    type: number
    sql: ${TABLE}.days_since_legal_docs_sent_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discovery_completed_c {
    type: yesno
    sql: ${TABLE}.discovery_completed_c ;;
  }

  dimension: dscorgpkg_attributed_to_discover_org_c {
    type: yesno
    sql: ${TABLE}.dscorgpkg_attributed_to_discover_org_c ;;
  }

  dimension: dscorgpkg_converted_from_discoverorg_data_c {
    type: yesno
    sql: ${TABLE}.dscorgpkg_converted_from_discoverorg_data_c ;;
  }

  dimension: economic_buyer_c {
    type: string
    sql: ${TABLE}.economic_buyer_c ;;
  }

  dimension_group: end_date_c {
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
    sql: ${TABLE}.end_date_c ;;
  }

  dimension: escrow_account_c {
    type: yesno
    sql: ${TABLE}.escrow_account_c ;;
  }

  dimension: eval_c {
    type: yesno
    sql: ${TABLE}.eval_c ;;
  }

  dimension_group: eval_start_date_c {
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
    sql: ${TABLE}.eval_start_date_c ;;
  }

  dimension: eval_term_c {
    type: number
    sql: ${TABLE}.eval_term_c ;;
  }

  dimension_group: first_meeting_date_c {
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
    sql: ${TABLE}.first_meeting_date_c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    type: yesno
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: include_year_1_acv_c {
    type: yesno
    sql: ${TABLE}.include_year_1_acv_c ;;
  }

  dimension: include_year_2_acv_c {
    type: yesno
    sql: ${TABLE}.include_year_2_acv_c ;;
  }

  dimension: include_year_3_acv_c {
    type: yesno
    sql: ${TABLE}.include_year_3_acv_c ;;
  }

  dimension: invisible_in_partner_community_mgtrx_c {
    type: yesno
    sql: ${TABLE}.invisible_in_partner_community_mgtrx_c ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.is_won ;;
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

  dimension: lead_product_c {
    type: string
    sql: ${TABLE}.lead_product_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: legal_counsel_c {
    type: string
    sql: ${TABLE}.legal_counsel_c ;;
  }

  dimension_group: legal_docs_sent_date_c {
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
    sql: ${TABLE}.legal_docs_sent_date_c ;;
  }

  dimension_group: legal_negotiations_finalized_date_c {
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
    sql: ${TABLE}.legal_negotiations_finalized_date_c ;;
  }

  dimension: legal_notes_c {
    type: string
    sql: ${TABLE}.legal_notes_c ;;
  }

  dimension: loss_reason_c {
    type: string
    sql: ${TABLE}.loss_reason_c ;;
  }

  dimension: manager_notes_c {
    type: string
    sql: ${TABLE}.manager_notes_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: need_c {
    type: string
    sql: ${TABLE}.need_c ;;
  }

  dimension: new_existing_business_c {
    type: string
    sql: ${TABLE}.new_existing_business_c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: opportunity_count_c {
    type: number
    sql: ${TABLE}.opportunity_count_c ;;
  }

  dimension: other_description_c {
    type: string
    sql: ${TABLE}.other_description_c ;;
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

  dimension: partner_2_c {
    type: string
    sql: ${TABLE}.partner_2_c ;;
  }

  dimension: partner_assigned_c {
    type: string
    sql: ${TABLE}.partner_assigned_c ;;
  }

  dimension: partner_c {
    type: string
    sql: ${TABLE}.partner_c ;;
  }

  dimension: partner_role_2_c {
    type: string
    sql: ${TABLE}.partner_role_2_c ;;
  }

  dimension: partner_role_3_c {
    type: string
    sql: ${TABLE}.partner_role_3_c ;;
  }

  dimension: partner_role_c {
    type: string
    sql: ${TABLE}.partner_role_c ;;
  }

  dimension: payment_terms_c {
    type: string
    sql: ${TABLE}.payment_terms_c ;;
  }

  dimension_group: poc_scheduled_c {
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
    sql: ${TABLE}.poc_scheduled_c ;;
  }

  dimension: poc_term_c {
    type: number
    sql: ${TABLE}.poc_term_c ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension_group: pricing_approved_on_c {
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
    sql: ${TABLE}.pricing_approved_on_c ;;
  }

  dimension: probability {
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension_group: proposal_sent_c {
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
    sql: ${TABLE}.proposal_sent_c ;;
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

  dimension: rfp_c {
    type: yesno
    sql: ${TABLE}.rfp_c ;;
  }

  dimension: risk_c {
    type: string
    sql: ${TABLE}.risk_c ;;
  }

  dimension: roi_analysis_completed_c {
    type: yesno
    sql: ${TABLE}.roi_analysis_completed_c ;;
  }

  dimension: se_approved_c {
    type: yesno
    sql: ${TABLE}.se_approved_c ;;
  }

  dimension: solution_engineer_c {
    type: string
    sql: ${TABLE}.solution_engineer_c ;;
  }

  dimension: solution_engineer_lookup_c {
    type: string
    sql: ${TABLE}.solution_engineer_lookup_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension_group: start_date_c {
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
    sql: ${TABLE}.start_date_c ;;
  }

  dimension_group: subscription_end_date_c {
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
    sql: ${TABLE}.subscription_end_date_c ;;
  }

  dimension_group: subscription_start_date_c {
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
    sql: ${TABLE}.subscription_start_date_c ;;
  }

  dimension: subscription_term_c {
    type: number
    sql: ${TABLE}.subscription_term_c ;;
  }

  dimension: synced_quote_id {
    type: string
    sql: ${TABLE}.synced_quote_id ;;
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

  dimension: tech_contact_c {
    type: string
    sql: ${TABLE}.tech_contact_c ;;
  }

  dimension: tech_contact_email_c {
    type: string
    sql: ${TABLE}.tech_contact_email_c ;;
  }

  dimension: tech_full_name_internal_internal_use_c {
    type: string
    sql: ${TABLE}.tech_full_name_internal_internal_use_c ;;
  }

  dimension: timeline_c {
    type: string
    sql: ${TABLE}.timeline_c ;;
  }

  dimension: transaction_type_c {
    type: string
    sql: ${TABLE}.transaction_type_c ;;
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

  dimension: x1_y_acv_c {
    type: string
    sql: ${TABLE}.x1_y_acv_c ;;
  }

  measure: y_1_acv_c {
    type: sum
    sql: ${TABLE}.y_1_acv_c::numeric;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: y_2_acv_c {
    type: sum
    sql: ${TABLE}.y_2_acv_c;;
      value_format_name: usd
  }


  measure: y_3_acv_c {
    type: sum
    sql: ${TABLE}.y_3_acv_c;;
      value_format_name: usd
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

# measure: total_y_1_acv_c {
#    type: sum
#    sql: ${y_1_acv_c};;
#  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      forecast_category_name,
      name,
      products.family,
      products.product_code,
      stage_name,
      campaigns.name,
      campaigns.id,
      accounts.name,
      accounts.id,
      owner_job_role,
      owner_territory,
      amount,
      y_1_acv_c,
      users.name
    ]
  }
}
