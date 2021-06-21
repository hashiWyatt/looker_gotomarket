view: organization_activation_status {
  derived_table: {
    sql: with

      activated_orgs as (
      select
        s.*
      from ${tfc_organizations_subscriptions.SQL_TABLE_NAME} s
      inner join terraform_cloud.org_created_state_version csv
      on s.organization_id = csv.organization_id
      and csv.timestamp > s.start_at
      )

      select
        distinct
        s.*,
        case
          when a.organization_id is not null then true
          else false
        end as activated
      from ${tfc_organizations_subscriptions.SQL_TABLE_NAME} s
      left join activated_orgs a
      on s.organization_id = a.organization_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: activated {
    type: yesno
    sql: ${TABLE}.activated ;;
  }

  set: detail {
    fields: [start_at_time, organization_id, plan, activated]
  }
}
