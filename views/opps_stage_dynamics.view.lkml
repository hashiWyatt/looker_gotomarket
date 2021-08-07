view: opps_stage_dynamics {
  label: "Opportunity Stage Dynamics"
  sql_table_name: bi_stage.opps_stage_dynamics ;;
  drill_fields: [opportunity_id, url, type, name, stage_name, created_date, created_fiscal_quarter, close_date, close_fiscal_quarter, segment, theater, region, quote_products]

  dimension: opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_date ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: moved_past_bookings {
    type: yesno
    sql: ${TABLE}.moved_past_bookings ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_business_validation {
    type: yesno
    sql: ${TABLE}.moved_past_business_validation ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_deal_review {
    type: yesno
    sql: ${TABLE}.moved_past_deal_review ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_discovery {
    type: yesno
    sql: ${TABLE}.moved_past_discovery ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_negotiation {
    type: yesno
    sql: ${TABLE}.moved_past_negotiation ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_success_planning {
    type: yesno
    sql: ${TABLE}.moved_past_success_planning ;;
    group_label: "Move Past Stage"
  }

  dimension: moved_past_technical_validation {
    type: yesno
    sql: ${TABLE}.moved_past_technical_validation ;;
    group_label: "Move Past Stage"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_acv {
    type: number
    sql: ${TABLE}.new_acv_c ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: theater {
    type: string
    sql: ${TABLE}.theater ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: quote_products {
    type: string
    sql: ${TABLE}.quote_products_c ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: y_1_acv {
    type: number
    sql: ${TABLE}.y_1_acv_c ;;
  }

  measure: count {
    type: count
  }

  measure: days_in_discovery_and_qualification {
    type: average
    sql: ${TABLE}.days_in_discovery_and_qualification ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_business_validation {
    type: average
    sql: ${TABLE}.days_in_business_validation ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_technical_validation {
    type: average
    sql: ${TABLE}.days_in_technical_validation ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_success_planning {
    type: average
    sql: ${TABLE}.days_in_success_planning ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_deal_review {
    type: average
    sql: ${TABLE}.days_in_deal_review ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_negotiation_and_legal {
    type: average
    sql: ${TABLE}.days_in_negotiation_and_legal ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_bookings_review {
    type: average
    sql: ${TABLE}.days_in_bookings_review ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_to_cwo {
    type: average
    sql: ${TABLE}.days_to_cwo ;;
    group_label: "Days From Opp Creation"
  }

  measure: days_to_close {
    type: average
    sql: ${TABLE}.days_to_close ;;
    group_label: "Days From Opp Creation"
  }

  measure: age_days {
    type: average
    sql: ${TABLE}.age_days ;;
    group_label: "Days From Opp Creation"
  }

  measure: pipe_in_bookings {
    type: sum
    sql: ${TABLE}.pipe_in_bookings ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_business_validation {
    type: sum
    sql: ${TABLE}.pipe_in_business_validation ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_closed_won {
    type: sum
    sql: ${TABLE}.pipe_in_closed_won ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_deal_review {
    type: sum
    sql: ${TABLE}.pipe_in_deal_review ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_discovery {
    type: sum
    sql: ${TABLE}.pipe_in_discovery ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_negotiation {
    type: sum
    sql: ${TABLE}.pipe_in_negotiation ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_success_planning {
    type: sum
    sql: ${TABLE}.pipe_in_success_planning ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  measure: pipe_in_technical_validation {
    type: sum
    sql: ${TABLE}.pipe_in_technical_validation ;;
    group_label: "Pipeline in Stage"
    value_format_name: "usd_0"
  }

  ## conversion to close
  measure: acv_conversion_discovery_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  ${opps_stage_dynamics.pipe_in_discovery};;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }

  measure: acv_conversion_business_validation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_business_validation},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }
  measure: acv_conversion_technical_validation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_technical_validation},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }
  measure: acv_conversion_success_planning_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_success_planning},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }
  measure: acv_conversion_deal_review_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_deal_review},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }
  measure: acv_conversion_negotiation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_negotiation},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"

  }
  measure: acv_conversion_bookings_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_bookings},0);;
    value_format_name: percent_1
    group_label: "Conversion to CWO"
  }

  ## conversion to next stage
  measure: acv_conversion_discovery_to_business_validation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_business_validation} /  ${opps_stage_dynamics.pipe_in_discovery};;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_business_validation_to_technical_validation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_technical_validation} /  nullif(${opps_stage_dynamics.pipe_in_business_validation},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_technical_validation_to_success_planning {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_success_planning} /  nullif(${opps_stage_dynamics.pipe_in_technical_validation},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_success_planning_to_deal_review {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_deal_review} /  nullif(${opps_stage_dynamics.pipe_in_success_planning},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_deal_review_to_negotiation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_negotiation} /  nullif(${opps_stage_dynamics.pipe_in_deal_review},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_negotiation_to_bookings {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_bookings} /  nullif(${opps_stage_dynamics.pipe_in_negotiation},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }
  measure: acv_conversion_bookings_to_cwo_copy {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_bookings},0);;
    value_format_name: percent_1
    group_label: "Conversion to Next Stage"
  }

  measure: dummy_null {
    type:  number
    sql:  NULL ;;
  }
}
