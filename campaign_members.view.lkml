view: campaign_members {
  sql_table_name: salesforce.campaign_members ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_or_account {
    type: string
    sql: ${TABLE}.company_or_account ;;
  }

  dimension: contact_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.contact_id ;;
  }

  dimension: country {
    type: string
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension_group: first_responded {
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
    sql: ${TABLE}.first_responded_date ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: has_opted_out_of_fax {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_fax ;;
  }

  dimension: has_responded {
    type: yesno
    sql: ${TABLE}.has_responded ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: lead_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.lead_id ;;
  }

  dimension: lead_or_contact_id {
    type: string
    sql: ${TABLE}.lead_or_contact_id ;;
  }

  dimension: lead_or_contact_owner_id {
    type: string
    sql: ${TABLE}.lead_or_contact_owner_id ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      last_name,
      first_name,
      contacts.middle_name,
      contacts.last_name,
      contacts.first_name,
      contacts.name,
      contacts.id,
      campaigns.name,
      campaigns.id,
      leads.middle_name,
      leads.name,
      leads.first_name,
      leads.last_name,
      leads.id
    ]
  }
}
