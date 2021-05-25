view: tfc_internal_organizations {
  derived_table: {
    sql:
      select
        distinct organization_id
      from terraform_cloud.create_organization where user_id in (select user_id from ${tfc_internal_users.SQL_TABLE_NAME}) and organization_id is not null
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  set: detail {
    fields: [organization_id]
  }
}
