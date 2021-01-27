view: cloud_organization_invoice_c {
  sql_table_name: salesforce_v2.cloud_organization_invoice_c ;;
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

  dimension: charged_against_credits_c {
    type: yesno
    sql: ${TABLE}.charged_against_credits_c ;;
  }

  dimension: cloud_billed_usage_c {
    type: string
    sql: ${TABLE}.cloud_billed_usage_c ;;
  }

  dimension: cloud_billing_account_id_c {
    type: string
    sql: ${TABLE}.cloud_billing_account_id_c ;;
  }

  dimension_group: cloud_billing_end_date_c {
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
    sql: ${TABLE}.cloud_billing_end_date_c ;;
  }

  dimension: cloud_billing_invoice_id_c {
    type: string
    sql: ${TABLE}.cloud_billing_invoice_id_c ;;
  }

  dimension_group: cloud_billing_start_date_c {
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
    sql: ${TABLE}.cloud_billing_start_date_c ;;
  }

  dimension: cloud_organization_id_c {
    type: string
    # hidden: yes
    sql: ${TABLE}.cloud_organization_id_c ;;
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

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_delinquent_c {
    type: yesno
    sql: ${TABLE}.is_delinquent_c ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sfdc_cloud_organization_c {
    type: string
    sql: ${TABLE}.sfdc_cloud_organization_c ;;
  }

  dimension: sfdc_cloud_organization_usage_c {
    type: string
    sql: ${TABLE}.sfdc_cloud_organization_usage_c ;;
  }

  dimension: stripe_invoice_amount_c {
    type: number
    sql: ${TABLE}.stripe_invoice_amount_c ;;
  }

  dimension: stripe_invoice_billing_country_c {
    type: string
    sql: ${TABLE}.stripe_invoice_billing_country_c ;;
  }

  dimension: stripe_invoice_billing_postal_code_c {
    type: string
    sql: ${TABLE}.stripe_invoice_billing_postal_code_c ;;
  }

  dimension: stripe_invoice_billing_state_c {
    type: string
    sql: ${TABLE}.stripe_invoice_billing_state_c ;;
  }

  dimension: stripe_invoice_email_c {
    type: string
    sql: ${TABLE}.stripe_invoice_email_c ;;
  }

  dimension_group: stripe_paid_on_date_c {
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
    sql: ${TABLE}.stripe_paid_on_date_c ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, cloud_organization_c.name, cloud_organization_c.id]
  }
}
