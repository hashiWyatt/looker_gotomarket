view: opportunity_product {
  sql_table_name: salesforce.opportunity_product ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: discount {
    type: string
    sql: ${TABLE}.discount ;;
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

  dimension: line_subscription_term_c {
    type: number
    sql: ${TABLE}.line_subscription_term_c ;;
  }

  dimension: list_price {
    type: string
    sql: ${TABLE}.list_price ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: pricebook_entry_id {
    type: string
    sql: ${TABLE}.pricebook_entry_id ;;
  }

  dimension: product_2_id {
    type: string
    sql: ${TABLE}.product_2_id ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: product_name_mgtrx_c {
    type: string
    sql: ${TABLE}.product_name_mgtrx_c ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
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

  dimension_group: service {
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
    sql: ${TABLE}.service_date ;;
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

  dimension: total_price {
    type: string
    sql: ${TABLE}.total_price ;;
  }

  dimension: unit_price {
    type: string
    sql: ${TABLE}.unit_price ;;
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

  measure: y_1_acv_c {
    type: sum
    sql: ${TABLE}.y_1_acv_c::numeric;;
    value_format_name: usd
  }

  dimension: y_2_acv_c {
    type: string
    sql: ${TABLE}.y_2_acv_c ;;
  }

  dimension: y_3_acv_c {
    type: string
    sql: ${TABLE}.y_3_acv_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
