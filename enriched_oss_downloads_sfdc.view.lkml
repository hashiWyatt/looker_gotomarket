view: enriched_oss_downloads_sfdc {
  sql_table_name: enriched_oss_downloads_sfdc;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: company_legal_name {
    type: string
    sql: ${TABLE}.company_legal_name ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: architecture {
    type: string
    sql: ${TABLE}.architecture ;;
  }

  dimension_group: download_timestamp {
    type: time
    sql: ${TABLE}.download_timestamp ;;
  }

  dimension: company_domain {
    type: string
    sql: ${TABLE}.company_domain ;;
  }

  dimension: company_description {
    type: string
    sql: ${TABLE}.company_description ;;
  }

  dimension: company_logo {
    type: string
    sql: ${TABLE}.company_logo ;;
  }

  dimension: company_year_founded {
    type: number
    sql: ${TABLE}.company_year_founded ;;
  }

  dimension: company_country {
    type: string
    sql: ${TABLE}.company_country ;;
  }

  dimension: company_state {
    type: string
    sql: ${TABLE}.company_state ;;
  }

  dimension: company_city {
    type: string
    sql: ${TABLE}.company_city ;;
  }

  dimension: company_postal_code {
    type: string
    sql: ${TABLE}.company_postal_code ;;
  }

  dimension: company_street_name {
    type: string
    sql: ${TABLE}.company_street_name ;;
  }

  dimension: company_street_number {
    type: string
    sql: ${TABLE}.company_street_number ;;
  }

  dimension: company_time_zone {
    type: string
    sql: ${TABLE}.company_time_zone ;;
  }

  dimension: company_utc_offset {
    type: number
    sql: ${TABLE}.company_utc_offset ;;
  }

  dimension: company_sector {
    type: string
    sql: ${TABLE}.company_sector ;;
  }

  dimension: company_industry_group {
    type: string
    sql: ${TABLE}.company_industry_group ;;
  }

  dimension: company_industry {
    type: string
    sql: ${TABLE}.company_industry ;;
  }

  dimension: company_sub_industry {
    type: string
    sql: ${TABLE}.company_sub_industry ;;
  }

  dimension: company_sic_code {
    type: string
    sql: ${TABLE}.company_sic_code ;;
  }

  dimension: company_naics_code {
    type: string
    sql: ${TABLE}.company_naics_code ;;
  }

  dimension: company_facebook_handle {
    type: string
    sql: ${TABLE}.company_facebook_handle ;;
  }

  dimension: company_linkedin_handle {
    type: string
    sql: ${TABLE}.company_linkedin_handle ;;
  }

  dimension: company_twitter_handle {
    type: string
    sql: ${TABLE}.company_twitter_handle ;;
  }

  dimension: company_crunchbase_handle {
    type: string
    sql: ${TABLE}.company_crunchbase_handle ;;
  }

  dimension: company_us_rank {
    type: number
    sql: ${TABLE}.company_us_rank ;;
  }

  dimension: company_alexa_global_rank {
    type: number
    sql: ${TABLE}.company_alexa_global_rank ;;
  }

  dimension: company_employees_count {
    type: number
    sql: ${TABLE}.company_employees_count ;;
  }

  dimension: company_market_cap {
    type: number
    sql: ${TABLE}.company_market_cap ;;
  }

  dimension: company_money_raised {
    type: number
    sql: ${TABLE}.company_money_raised ;;
  }

  dimension: company_annual_revenue {
    type: number
    sql: ${TABLE}.company_annual_revenue ;;
  }

  dimension: company_estimated_annual_revenue {
    type: string
    sql: ${TABLE}.company_estimated_annual_revenue ;;
  }

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.sfdc_account_id ;;
  }

  dimension: sfdc_target_account {
    type: string
    sql: ${TABLE}.sfdc_target_account ;;
  }

  dimension: sfdc_account_owner {
    type: string
    sql: ${TABLE}.sfdc_account_owner ;;
  }

  dimension: sfdc_geo_segment {
    type: string
    sql: ${TABLE}.sfdc_geo_segment ;;
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

  set: detail {
    fields: [
      ip_address,
      id,
      product,
      company_legal_name,
      context_page_referrer,
      version,
      architecture,
      download_timestamp_time,
      company_domain,
      company_description,
      company_logo,
      company_year_founded,
      company_country,
      company_state,
      company_city,
      company_postal_code,
      company_street_name,
      company_street_number,
      company_time_zone,
      company_utc_offset,
      company_sector,
      company_industry_group,
      company_industry,
      company_sub_industry,
      company_sic_code,
      company_naics_code,
      company_facebook_handle,
      company_linkedin_handle,
      company_twitter_handle,
      company_crunchbase_handle,
      company_us_rank,
      company_alexa_global_rank,
      company_employees_count,
      company_market_cap,
      company_money_raised,
      company_annual_revenue,
      company_estimated_annual_revenue,
      company_id,
      sfdc_account_id,
      sfdc_target_account,
      sfdc_account_owner,
      sfdc_geo_segment,
      sfdc_segment,
      sfdc_geo,
      sfdc_theater
    ]
  }
}
