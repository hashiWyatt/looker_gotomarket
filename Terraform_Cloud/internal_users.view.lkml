view: tfc_internal_users {
  derived_table: {
    sql: select distinct user_id from terraform_cloud.user_id_by_email where email like '%@hashicorp.com'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  set: detail {
    fields: [user_id, email]
  }
}
