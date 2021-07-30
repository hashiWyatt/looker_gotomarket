view: opps_stage_dynamics {
  label: "Opportunity Stage Dynamics"
  sql_table_name: bi_stage.opps_stage_dynamics ;;
  drill_fields: [id, url, type, name, stage_name, created_date, created_fiscal_quarter, close_date, close_fiscal_quarter, segment, theater, geo]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: geo {
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: moved_past_bookings {
    type: yesno
    sql: ${TABLE}.moved_past_bookings ;;
  }

  dimension: moved_past_business_validation {
    type: yesno
    sql: ${TABLE}.moved_past_business_validation ;;
  }

  dimension: moved_past_deal_review {
    type: yesno
    sql: ${TABLE}.moved_past_deal_review ;;
  }

  dimension: moved_past_discovery {
    type: yesno
    sql: ${TABLE}.moved_past_discovery ;;
  }

  dimension: moved_past_negotiation {
    type: yesno
    sql: ${TABLE}.moved_past_negotiation ;;
  }

  dimension: moved_past_success_planning {
    type: yesno
    sql: ${TABLE}.moved_past_success_planning ;;
  }

  dimension: moved_past_technical_validation {
    type: yesno
    sql: ${TABLE}.moved_past_technical_validation ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_acv_c {
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

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: y_1_acv_c {
    type: number
    sql: ${TABLE}.y_1_acv_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, stage_name]
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

  measure: days_in_negotiotation_and_legal {
    type: average
    sql: ${TABLE}.days_in_negotiotation_and_legal ;;
    group_label: "Avg Days in Stage"
  }

  measure: days_in_bookings_review {
    type: average
    sql: ${TABLE}.days_in_bookings_review ;;
    group_label: "Avg Days in Stage"
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
    group_label: "ACV Conversion to CWO"
  }

  measure: acv_conversion_business_validation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_business_validation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }
  measure: acv_conversion_technical_validation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_technical_validation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }
  measure: acv_conversion_success_planning_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_success_planning},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }
  measure: acv_conversion_deal_review_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_deal_review},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }
  measure: acv_conversion_negotiation_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_negotiation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }
  measure: acv_conversion_bookings_to_cwo {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_bookings},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to CWO"

  }

  ## conversion to next stage
  measure: acv_conversion_discovery_to_business_validation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_business_validation} /  ${opps_stage_dynamics.pipe_in_discovery};;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"
  }

  measure: acv_conversion_business_validation_to_technical_validation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_technical_validation} /  nullif(${opps_stage_dynamics.pipe_in_business_validation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }
  measure: acv_conversion_technical_validation_to_success_planning {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_success_planning} /  nullif(${opps_stage_dynamics.pipe_in_technical_validation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }
  measure: acv_conversion_success_planning_to_deal_review {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_deal_review} /  nullif(${opps_stage_dynamics.pipe_in_success_planning},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }
  measure: acv_conversion_deal_review_to_negotiation {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_negotiation} /  nullif(${opps_stage_dynamics.pipe_in_deal_review},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }
  measure: acv_conversion_negotiation_to_bookings {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_bookings} /  nullif(${opps_stage_dynamics.pipe_in_negotiation},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }
  measure: acv_conversion_bookings_to_cwo_copy {
    type: number
    sql: ${opps_stage_dynamics.pipe_in_closed_won} /  nullif(${opps_stage_dynamics.pipe_in_bookings},0);;
    value_format_name: percent_1
    group_label: "ACV Conversion to Next Stage"

  }

  measure: dummy_null {
    type:  number
    sql:  NULL ;;
  }
}
