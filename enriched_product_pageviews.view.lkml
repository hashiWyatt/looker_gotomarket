view: enriched_product_pageviews {
  sql_table_name: enriched_product_page_views ;;

  dimension: ip_address {
    primary_key: yes
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
  dimension: url {
    type:  string
    sql: ${TABLE}.url ;;
  }
  dimension_group: pageview_timestamp {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pageview_timestamp ;;
  }

  dimension: company_legal_name {
    type: string
    sql: ${TABLE}.company_legal_name ;;
  }
  dimension: company_domain {
    type: string
    sql: ${TABLE}.company_domain ;;
  }
  dimension: company_logo {
    type: string
    sql: ${TABLE}.company_logo ;;
  }

  dimension: company_year_founded {
    type: date_year
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

  dimension: company_zipcode {
    type: zipcode
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
    sql: ${TABLE}.company_money_raised;;
  }

  dimension: company_annual_revenue {
    type: number
    sql: ${TABLE}.company_annual_revenue ;;
  }

  dimension: company_estimated_annual_revenue {
    type: number
    sql: ${TABLE}.company_estimated_annual_revenue ;;
  }

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }
  measure: pageviews_count {
    type:  count
    drill_fields: [id, product]
  }
}
