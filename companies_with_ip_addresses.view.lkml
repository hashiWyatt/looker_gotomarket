view: companies_with_ip_addresses {
  sql_table_name: clearbit.companies_with_ip_addresses ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: alexa_global_rank {
    type: number
    sql: ${TABLE}.alexa_global_rank ;;
  }

  dimension: alexa_us_rank {
    type: number
    sql: ${TABLE}.alexa_us_rank ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: crunchbase_handle {
    type: string
    sql: ${TABLE}.crunchbase_handle ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: employees {
    type: number
    sql: ${TABLE}.employees ;;
  }

  dimension: estimated_annual_revenue {
    type: string
    sql: ${TABLE}.estimated_annual_revenue ;;
  }

  dimension: facebook_handle {
    type: string
    sql: ${TABLE}.facebook_handle ;;
  }

  dimension: founded_year {
    type: number
    sql: ${TABLE}.founded_year ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_group {
    type: string
    sql: ${TABLE}.industry_group ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  dimension: linkedin_handle {
    type: string
    sql: ${TABLE}.linkedin_handle ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.logo ;;
  }

  dimension: market_cap {
    type: number
    sql: ${TABLE}.market_cap ;;
  }

  dimension: naics_code {
    type: string
    sql: ${TABLE}.naics_code ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: raised {
    type: number
    sql: ${TABLE}.raised ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: sic_code {
    type: string
    sql: ${TABLE}.sic_code ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: street_number {
    type: string
    sql: ${TABLE}.street_number ;;
  }

  dimension: sub_industry {
    type: string
    sql: ${TABLE}.sub_industry ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: twitter_handle {
    type: string
    sql: ${TABLE}.twitter_handle ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: utc_offset {
    type: number
    sql: ${TABLE}.utc_offset ;;
  }

  measure: count {
    type: count
    drill_fields: [id, street_name, legal_name]
  }
}
