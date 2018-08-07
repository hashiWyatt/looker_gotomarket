view: opportunity_product_fullinfo {
  derived_table: {
    sql: SELECT
      op.id as op_id,
      op.created_date,
      op.discount,
      op.line_subscription_term_c,
      op.service_date,
      op.total_price,
      op.y_2_acv_c,
      op.y_3_acv_c,
      op.last_modified_by_id,
      op.opportunity_id,
      op.created_by_id,
      op.description as op_description,
      op.pricebook_entry_id,
      op.product_2_id,
      op.quantity,
      op.unit_price,
      op.is_deleted,
      op.last_modified_date,
      op.list_price,
      op.product_code,
      op.product_name_mgtrx_c,
      op.y_1_acv_c,
      op.is_deleted as op_is_deleted,
      p.id as prod_id,
      p.is_deleted as prod_is_deleted,
      p.product_code as prod_product_code,
      p.created_by_id as prod_created_by_id,
      p.description as prod_description,
      p.family,
      p.last_modified_date as prod_last_modified_date,
      p.name as prod_name,
      p.product_case_safe_id_c,
      p.product_family_description_c,
      p.unit_value_c,
      p.created_date as prod_created_date,
      p.is_active,
      p.entitlements_c,
      p.is_product_visible_c,
      p.services_events_sku_c,
      p.minimum_quantity_c
      FROM salesforce.opportunity_product as op
      LEFT OUTER JOIN salesforce.products as p ON (p.id = op.product_2_id)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: op_id {
    type: string
    sql: ${TABLE}.op_id ;;
    primary_key: yes
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: discount {
    type: string
    sql: ${TABLE}.discount ;;
  }

  dimension: line_subscription_term_c {
    type: number
    sql: ${TABLE}.line_subscription_term_c ;;
  }

  dimension_group: service_date {
    type: time
    sql: ${TABLE}.service_date ;;
  }

  dimension: total_price {
    type: string
    sql: ${TABLE}.total_price ;;
  }

  dimension: y_2_acv_c {
    type: string
    sql: ${TABLE}.y_2_acv_c ;;
  }

  dimension: y_3_acv_c {
    type: string
    sql: ${TABLE}.y_3_acv_c ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: op_description {
    type: string
    sql: ${TABLE}.op_description ;;
  }

  dimension: pricebook_entry_id {
    type: string
    sql: ${TABLE}.pricebook_entry_id ;;
  }

  dimension: product_2_id {
    type: string
    sql: ${TABLE}.product_2_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price {
    type: string
    sql: ${TABLE}.unit_price ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: list_price {
    type: string
    sql: ${TABLE}.list_price ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: product_name_mgtrx_c {
    type: string
    sql: ${TABLE}.product_name_mgtrx_c ;;
  }

  dimension: y_1_acv_c {
    type: string
    sql: ${TABLE}.y_1_acv_c ;;
  }

  dimension: op_is_deleted {
    type: string
    sql: ${TABLE}.op_is_deleted ;;
  }

  dimension: prod_id {
    type: string
    sql: ${TABLE}.prod_id ;;
  }

  dimension: prod_is_deleted {
    type: string
    sql: ${TABLE}.prod_is_deleted ;;
  }

  dimension: prod_product_code {
    type: string
    sql: ${TABLE}.prod_product_code ;;
  }

  dimension: prod_created_by_id {
    type: string
    sql: ${TABLE}.prod_created_by_id ;;
  }

  dimension: prod_description {
    type: string
    sql: ${TABLE}.prod_description ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension_group: prod_last_modified_date {
    type: time
    sql: ${TABLE}.prod_last_modified_date ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: product_case_safe_id_c {
    type: string
    sql: ${TABLE}.product_case_safe_id_c ;;
  }

  dimension: product_family_description_c {
    type: string
    sql: ${TABLE}.product_family_description_c ;;
  }

  dimension: unit_value_c {
    type: string
    sql: ${TABLE}.unit_value_c ;;
  }

  dimension_group: prod_created_date {
    type: time
    sql: ${TABLE}.prod_created_date ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.is_active ;;
  }

  dimension: entitlements_c {
    type: string
    sql: ${TABLE}.entitlements_c ;;
  }

  dimension: is_product_visible_c {
    type: number
    sql: ${TABLE}.is_product_visible_c ;;
  }

  dimension: services_events_sku_c {
    type: string
    sql: ${TABLE}.services_events_sku_c ;;
  }

  dimension: minimum_quantity_c {
    type: number
    sql: ${TABLE}.minimum_quantity_c ;;
  }

  dimension: line_revenue {
    type: number
    sql:  ${quantity} * ${unit_price} ;;
  }

  measure:  total_revenue {
    type: sum
    sql: ${line_revenue} ;;
  }

  set: detail {
    fields: [
      op_id,
      created_date_time,
      discount,
      line_subscription_term_c,
      service_date_time,
      total_price,
      y_2_acv_c,
      y_3_acv_c,
      last_modified_by_id,
      opportunity_id,
      created_by_id,
      op_description,
      pricebook_entry_id,
      product_2_id,
      quantity,
      unit_price,
      is_deleted,
      last_modified_date_time,
      list_price,
      product_code,
      product_name_mgtrx_c,
      y_1_acv_c,
      op_is_deleted,
      prod_id,
      prod_is_deleted,
      prod_product_code,
      prod_created_by_id,
      prod_description,
      family,
      prod_last_modified_date_time,
      prod_name,
      product_case_safe_id_c,
      product_family_description_c,
      unit_value_c,
      prod_created_date_time,
      is_active,
      entitlements_c,
      is_product_visible_c,
      services_events_sku_c,
      minimum_quantity_c,
      line_revenue
    ]
  }
}
