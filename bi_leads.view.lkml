view: bi_leads {
  sql_table_name: bi.leads ;;
  drill_fields: [lead_id]

  dimension: lead_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.lead_id ;;
  }

  dimension: ad_campaign_name_ft {
    type: string
    sql: ${TABLE}.ad_campaign_name_ft ;;
  }

  dimension: campaign_touches {
    type: number
    sql: ${TABLE}.campaign_touches ;;
  }

  dimension: campaign_touches_after_conversion {
    type: number
    sql: ${TABLE}.campaign_touches_after_conversion ;;
  }

  dimension: campaign_touches_before_conversion {
    type: number
    sql: ${TABLE}.campaign_touches_before_conversion ;;
  }

  dimension: campaign_touches_before_mql {
    type: number
    sql: ${TABLE}.campaign_touches_before_mql ;;
  }

  dimension: channel_lead {
    type: yesno
    sql: ${TABLE}.channel_lead ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension_group: converted_date {
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
    sql: ${TABLE}.converted_date ;;
  }

  dimension_group: converted_date_pst {
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
    sql: ${TABLE}.converted_date_pst ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: converted_quarter {
    type: string
    sql: ${TABLE}.converted_quarter ;;
  }


  dimension_group: created_date {
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

  dimension_group: created_date_pst {
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
    sql: ${TABLE}.created_date_pst ;;
  }


  dimension: created_quarter {
    type: string
    sql: ${TABLE}.created_quarter ;;
  }

  dimension_group: created_week {
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
    sql: ${TABLE}.created_week ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: is_channel_mql {
    type: number
    sql: ${TABLE}.is_channel_mql ;;
  }

  dimension: is_mql {
    type: number
    sql: ${TABLE}.is_mql ;;
  }

  dimension_group: lead_created {
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
    sql: ${TABLE}.lead_created_date ;;
  }

  dimension: lead_owner {
    type: string
    sql: ${TABLE}.lead_owner_c ;;
  }

  dimension: lead_source_bucket {
    type: string
    sql: ${TABLE}.lead_source_bucket_c ;;
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
    sql: ${TABLE}.lead_stage_date ;;
  }

  dimension_group: lead_stage_date_pst {
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
    sql: ${TABLE}.lead_stage_date_pst ;;
  }

  dimension: lead_stage_quarter {
    type: string
    sql: ${TABLE}.lead_stage_quarter ;;
  }

  dimension_group: lead_stage_week {
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
    sql: ${TABLE}.lead_stage_week ;;
  }

  dimension: lifecycle_stage {
    type: string
    sql: ${TABLE}.lifecycle_stage_c ;;
  }

  dimension: marketing_channel_bucket {
    type: string
    sql: ${TABLE}.marketing_channel_bucket ;;
  }

  dimension: marketing_channel_ft {
    type: string
    sql: ${TABLE}.marketing_channel_ft ;;
  }

  dimension_group: opp_close {
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
    sql: ${TABLE}.opp_close_date ;;
  }

  dimension: opp_is_deleted {
    type: yesno
    sql: ${TABLE}.opp_is_deleted ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}.opp_stage_name ;;
  }

  dimension: owner_account_geo {
    type: string
    sql: ${TABLE}.owner_account_geo ;;
  }

  dimension: owner_account_segment {
    type: string
    sql: ${TABLE}.owner_account_segment ;;
  }

  dimension: owner_account_theater {
    type: string
    sql: ${TABLE}.owner_account_theater ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  dimension: owner_geo {
    type: string
    sql: ${TABLE}.owner_geo ;;
  }

  dimension: owner_segment {
    type: string
    sql: ${TABLE}.owner_segment ;;
  }

  dimension: owner_theater {
    type: string
    sql: ${TABLE}.owner_theater ;;
  }

  dimension: pql_product {
    type: string
    sql: ${TABLE}.pql_product ;;
  }

  dimension_group: sal_month {
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
    sql: ${TABLE}.sal_month ;;
  }

  dimension: sal_quarter {
    type: string
    sql: ${TABLE}.sal_quarter ;;
  }

  dimension_group: sal_stage {
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
    sql: ${TABLE}.sal_stage_date ;;
  }

  dimension_group: sal_stage_date_pst {
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
    sql: ${TABLE}.sal_stage_date_pst ;;
  }


  dimension: sales_ready_reason {
    type: string
    sql: ${TABLE}.sales_ready_reason ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tfc_signup {
    type: yesno
    sql: ${TABLE}.tfc_signup ;;
  }

  dimension: hcp_signup {
    type: yesno
    sql: ${TABLE}.hcp_signup ;;
  }

  dimension: total_campaigns {
    type: number
    sql: ${TABLE}.total_campaigns ;;
  }

  dimension: unqualified_quarter {
    type: string
    sql: ${TABLE}.unqualified_quarter ;;
  }

  dimension_group: unqualified_stage {
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
    sql: ${TABLE}.unqualified_stage_date ;;
  }

  dimension_group: unqualified_stage_date_pst {
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
    sql: ${TABLE}.unqualified_stage_date_pst ;;
  }

  dimension: y_1_acv_c {
    type: number
    sql: ${TABLE}.y_1_acv_c ;;
  }

  measure: count {
    type: count
    drill_fields: [lead_id, opp_stage_name]
  }
}
