view: sfdc_account_superview {
  sql_table_name: public.sfdc_account_superview ;;

  dimension: architecture {
    type: string
    sql: ${TABLE}.architecture ;;
  }

  dimension: company_country {
    type: string
    sql: ${TABLE}.company_country ;;
  }

  dimension: company_domain {
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: company_industry {
    type: string
    sql: ${TABLE}.company_industry ;;
  }

  dimension: company_legal_name {
    type: string
    sql: ${TABLE}.company_legal_name ;;
  }

  dimension: company_naics_code {
    type: string
    sql: ${TABLE}.company_naics_code ;;
  }

  dimension: company_sector {
    type: string
    sql: ${TABLE}.company_sector ;;
  }

  dimension: company_sic_code {
    type: string
    sql: ${TABLE}.company_sic_code ;;
  }

  dimension: company_state {
    type: string
    sql: ${TABLE}.company_state ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension_group: download_timestamp {
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
    sql: ${TABLE}.download_timestamp ;;
  }

  dimension_group: hcs_created {
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
    sql: ${TABLE}.hcs_created_date ;;
  }

  dimension: hcs_email {
    type: string
    sql: ${TABLE}.hcs_email ;;
  }

  dimension_group: hcs_most_recent_login {
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
    sql: ${TABLE}.hcs_most_recent_login ;;
  }

  dimension: hcs_subid {
    type: string
    sql: ${TABLE}.hcs_subid ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.sfdc_account_id ;;
  }

  dimension: sfdc_account_owner {
    type: string
    sql: ${TABLE}.sfdc_account_owner ;;
  }

  dimension: sfdc_geo {
    type: string
    sql: ${TABLE}.sfdc_geo ;;
  }

  dimension: sfdc_segment {
    type: string
    sql: ${TABLE}.sfdc_segment ;;
  }

  dimension: sfdc_theater {
    type: string
    sql: ${TABLE}.sfdc_theater ;;
  }

  dimension: tfc_email {
    type: string
    sql: ${TABLE}.tfc_email ;;
  }

  dimension_group: tfc_most_recent_login {
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
    sql: ${TABLE}.tfc_most_recent_login ;;
  }

  dimension: tfc_plan {
    type: string
    sql: ${TABLE}.tfc_plan ;;
  }

  dimension: tfc_userid {
    type: string
    sql: ${TABLE}.tfc_userid ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [company_legal_name]
  }
}
