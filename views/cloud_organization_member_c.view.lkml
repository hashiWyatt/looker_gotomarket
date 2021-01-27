view: cloud_organization_member_c {
  sql_table_name: salesforce_v2.cloud_organization_member_c ;;
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

  dimension: auth_0_id_c {
    type: string
    sql: ${TABLE}.auth_0_id_c ;;
  }

  dimension: cloud_organization_id_c {
    type: string
    # hidden: yes
    sql: ${TABLE}.cloud_organization_id_c ;;
  }

  dimension: cloud_user_id_c {
    type: string
    sql: ${TABLE}.cloud_user_id_c ;;
  }

  dimension: contact_c {
    type: string
    sql: ${TABLE}.contact_c ;;
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

  dimension: email_c {
    type: string
    sql: ${TABLE}.email_c ;;
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

  dimension: lead_c {
    type: string
    sql: ${TABLE}.lead_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sfdc_cloud_organization_c {
    type: string
    sql: ${TABLE}.sfdc_cloud_organization_c ;;
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

  dimension: title_c {
    type: string
    sql: ${TABLE}.title_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, cloud_organization_c.name, cloud_organization_c.id]
  }
}
