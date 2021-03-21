view: zendesk_ticket_detail {
  derived_table: {
    sql: select * from zendesk.ticket
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: via_channel {
    type: string
    sql: ${TABLE}.via_channel ;;
  }

  dimension: via_source_from_id {
    type: number
    sql: ${TABLE}.via_source_from_id ;;
  }

  dimension: via_source_from_title {
    type: string
    sql: ${TABLE}.via_source_from_title ;;
  }

  dimension: via_source_from_address {
    type: string
    sql: ${TABLE}.via_source_from_address ;;
  }

  dimension: via_source_to_name {
    type: string
    sql: ${TABLE}.via_source_to_name ;;
  }

  dimension: via_source_to_address {
    type: string
    sql: ${TABLE}.via_source_to_address ;;
  }

  dimension: via_source_rel {
    type: string
    sql: ${TABLE}.via_source_rel ;;
  }

  dimension: merged_ticket_ids {
    type: string
    sql: ${TABLE}.merged_ticket_ids ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: recipient {
    type: string
    sql: ${TABLE}.recipient ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.requester_id ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: forum_topic_id {
    type: number
    sql: ${TABLE}.forum_topic_id ;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: has_incidents {
    type: string
    sql: ${TABLE}.has_incidents ;;
  }

  dimension: is_public {
    type: string
    sql: ${TABLE}.is_public ;;
  }

  dimension_group: due_at {
    type: time
    sql: ${TABLE}.due_at ;;
  }

  dimension: ticket_form_id {
    type: number
    sql: ${TABLE}.ticket_form_id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: allow_channelback {
    type: string
    sql: ${TABLE}.allow_channelback ;;
  }

  dimension: system_location {
    type: string
    sql: ${TABLE}.system_location ;;
  }

  dimension: system_client {
    type: string
    sql: ${TABLE}.system_client ;;
  }

  dimension: system_latitude {
    type: number
    sql: ${TABLE}.system_latitude ;;
  }

  dimension: system_longitude {
    type: number
    sql: ${TABLE}.system_longitude ;;
  }

  dimension: system_ip_address {
    type: string
    sql: ${TABLE}.system_ip_address ;;
  }

  dimension: custom_consul_component {
    type: string
    sql: ${TABLE}.custom_consul_component ;;
  }

  dimension: custom_support_ops_component {
    type: string
    sql: ${TABLE}.custom_support_ops_component ;;
  }

  dimension: custom_tfe_digital_nurture {
    type: string
    sql: ${TABLE}.custom_tfe_digital_nurture ;;
  }

  dimension: custom_vault_version {
    type: string
    sql: ${TABLE}.custom_vault_version ;;
  }

  dimension: custom_escalation_reason {
    type: string
    sql: ${TABLE}.custom_escalation_reason ;;
  }

  dimension: custom_asana_title {
    type: string
    sql: ${TABLE}.custom_asana_title ;;
  }

  dimension: custom_consul_support_engineer_included {
    type: string
    sql: ${TABLE}.custom_consul_support_engineer_included ;;
  }

  dimension: custom_last_known_version {
    type: string
    sql: ${TABLE}.custom_last_known_version ;;
  }

  dimension: custom_vault_sub_product {
    type: string
    sql: ${TABLE}.custom_vault_sub_product ;;
  }

  dimension: custom_escalated_by_sofia_to_ams {
    type: string
    sql: ${TABLE}.custom_escalated_by_sofia_to_ams ;;
  }

  dimension: custom_terraform_cli_version {
    type: string
    sql: ${TABLE}.custom_terraform_cli_version ;;
  }

  dimension: custom_terraform_enterprise_version {
    type: string
    sql: ${TABLE}.custom_terraform_enterprise_version ;;
  }

  dimension: custom_consul_sub_product {
    type: string
    sql: ${TABLE}.custom_consul_sub_product ;;
  }

  dimension: custom_vault_escalation_to_eng {
    type: string
    sql: ${TABLE}.custom_vault_escalation_to_eng ;;
  }

  dimension: custom_faq_kb_material {
    type: string
    sql: ${TABLE}.custom_faq_kb_material ;;
  }

  dimension: custom_stage {
    type: string
    sql: ${TABLE}.custom_stage ;;
  }

  dimension: custom_handoff {
    type: string
    sql: ${TABLE}.custom_handoff ;;
  }

  dimension: custom_no_reminders_tag_flag {
    type: string
    sql: ${TABLE}.custom_no_reminders_tag_flag ;;
  }

  dimension: custom_rca_completed {
    type: string
    sql: ${TABLE}.custom_rca_completed ;;
  }

  dimension: custom_asana_url {
    type: string
    sql: ${TABLE}.custom_asana_url ;;
  }

  dimension: custom_nomad_sub_product {
    type: string
    sql: ${TABLE}.custom_nomad_sub_product ;;
  }

  dimension: custom_beta_product {
    type: string
    sql: ${TABLE}.custom_beta_product ;;
  }

  dimension: custom_nomad_component {
    type: string
    sql: ${TABLE}.custom_nomad_component ;;
  }

  dimension: custom_do_not_reopen_follow_up_on_asana_close {
    type: string
    sql: ${TABLE}.custom_do_not_reopen_follow_up_on_asana_close ;;
  }

  dimension: custom_vault_component {
    type: string
    sql: ${TABLE}.custom_vault_component ;;
  }

  dimension: custom_terraform_component {
    type: string
    sql: ${TABLE}.custom_terraform_component ;;
  }

  dimension: custom_create_asana {
    type: string
    sql: ${TABLE}.custom_create_asana ;;
  }

  dimension: custom_product {
    type: string
    sql: ${TABLE}.custom_product ;;
  }

  dimension: custom_cause {
    type: string
    sql: ${TABLE}.custom_cause ;;
  }

  dimension: custom_next_steps {
    type: string
    sql: ${TABLE}.custom_next_steps ;;
  }

  dimension: custom_operating_system {
    type: string
    sql: ${TABLE}.custom_operating_system ;;
  }

  dimension: custom_vagrant_sub_product {
    type: string
    sql: ${TABLE}.custom_vagrant_sub_product ;;
  }

  dimension: custom_create_slack_channel {
    type: string
    sql: ${TABLE}.custom_create_slack_channel ;;
  }

  dimension: custom_engineer_included {
    type: string
    sql: ${TABLE}.custom_engineer_included ;;
  }

  dimension: custom_consul_version {
    type: string
    sql: ${TABLE}.custom_consul_version ;;
  }

  dimension: custom_escalated_by_tam {
    type: string
    sql: ${TABLE}.custom_escalated_by_tam ;;
  }

  dimension: custom_sub_product {
    type: string
    sql: ${TABLE}.custom_sub_product ;;
  }

  dimension: custom_account_class_admin_only_ {
    type: string
    sql: ${TABLE}.custom_account_class_admin_only_ ;;
  }

  dimension: custom_no_sla {
    type: string
    sql: ${TABLE}.custom_no_sla ;;
  }

  dimension: custom_sev_1_ticket {
    type: string
    sql: ${TABLE}.custom_sev_1_ticket ;;
  }

  dimension: custom_auto_solve {
    type: string
    sql: ${TABLE}.custom_auto_solve ;;
  }

  dimension: custom_nomad_version {
    type: string
    sql: ${TABLE}.custom_nomad_version ;;
  }

  dimension: custom_terraform_sub_product {
    type: string
    sql: ${TABLE}.custom_terraform_sub_product ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: system_raw_email_identifier {
    type: string
    sql: ${TABLE}.system_raw_email_identifier ;;
  }

  dimension: system_json_email_identifier {
    type: string
    sql: ${TABLE}.system_json_email_identifier ;;
  }

  dimension: system_message_id {
    type: string
    sql: ${TABLE}.system_message_id ;;
  }

  dimension: system_ccs {
    type: string
    sql: ${TABLE}.system_ccs ;;
  }

  dimension: custom_asana_id {
    type: string
    sql: ${TABLE}.custom_asana_id ;;
  }

  dimension: system_machine_generated {
    type: string
    sql: ${TABLE}.system_machine_generated ;;
  }

  dimension: custom_new_or_existing_ {
    type: string
    sql: ${TABLE}.custom_new_or_existing_ ;;
  }

  dimension: custom_customer_pain {
    type: string
    sql: ${TABLE}.custom_customer_pain ;;
  }

  dimension: followup_ids {
    type: string
    sql: ${TABLE}.followup_ids ;;
  }

  dimension: via_followup_source_id {
    type: number
    sql: ${TABLE}.via_followup_source_id ;;
  }

  set: detail {
    fields: [
      id,
      url,
      external_id,
      via_channel,
      via_source_from_id,
      via_source_from_title,
      via_source_from_address,
      via_source_to_name,
      via_source_to_address,
      via_source_rel,
      merged_ticket_ids,
      created_at_time,
      updated_at_time,
      type,
      subject,
      description,
      priority,
      status,
      recipient,
      requester_id,
      submitter_id,
      assignee_id,
      organization_id,
      group_id,
      forum_topic_id,
      problem_id,
      has_incidents,
      is_public,
      due_at_time,
      ticket_form_id,
      brand_id,
      allow_channelback,
      system_location,
      system_client,
      system_latitude,
      system_longitude,
      system_ip_address,
      custom_consul_component,
      custom_support_ops_component,
      custom_tfe_digital_nurture,
      custom_vault_version,
      custom_escalation_reason,
      custom_asana_title,
      custom_consul_support_engineer_included,
      custom_last_known_version,
      custom_vault_sub_product,
      custom_escalated_by_sofia_to_ams,
      custom_terraform_cli_version,
      custom_terraform_enterprise_version,
      custom_consul_sub_product,
      custom_vault_escalation_to_eng,
      custom_faq_kb_material,
      custom_stage,
      custom_handoff,
      custom_no_reminders_tag_flag,
      custom_rca_completed,
      custom_asana_url,
      custom_nomad_sub_product,
      custom_beta_product,
      custom_nomad_component,
      custom_do_not_reopen_follow_up_on_asana_close,
      custom_vault_component,
      custom_terraform_component,
      custom_create_asana,
      custom_product,
      custom_cause,
      custom_next_steps,
      custom_operating_system,
      custom_vagrant_sub_product,
      custom_create_slack_channel,
      custom_engineer_included,
      custom_consul_version,
      custom_escalated_by_tam,
      custom_sub_product,
      custom_account_class_admin_only_,
      custom_no_sla,
      custom_sev_1_ticket,
      custom_auto_solve,
      custom_nomad_version,
      custom_terraform_sub_product,
      _fivetran_synced_time,
      system_raw_email_identifier,
      system_json_email_identifier,
      system_message_id,
      system_ccs,
      custom_asana_id,
      system_machine_generated,
      custom_new_or_existing_,
      custom_customer_pain,
      followup_ids,
      via_followup_source_id
    ]
  }
}
