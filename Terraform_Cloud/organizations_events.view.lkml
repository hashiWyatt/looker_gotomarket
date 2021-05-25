view: tfc_organizations_events {
  derived_table: {
    sql: with org_events as (
          -- original_timestamp as event_at,
          -- user_id,
          -- event,
          -- organization_id,
          -- organization,
          -- run_source,
          -- created_by_service_account,
          -- client,
          -- api_client,
          -- cli_version

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          run_source,
          created_by_service_account,
          null as client,
          api_client,
          cli_version
        from terraform_cloud.create_run

        union

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          ''::text as run_source,
          false as created_by_service_account,
          client,
          api_client,
          null as cli_version
        from
        terraform_cloud.create_team

        union

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          null as run_source,
          false as created_by_service_account,
          client,
          api_client,
          cli_version
        from terraform_cloud.create_workspace

        union

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          null as run_source,
          false as created_by_service_account,
          client,
          api_client,
          null as cli_version
        from terraform_cloud.org_created_registry_module

        union

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          null as run_source,
          false as created_by_service_account,
          client,
          api_client,
          cli_version
        from terraform_cloud.org_created_state_version

        union

        select
          original_timestamp as event_at,
          user_id,
          event,
          organization_id,
          organization,
          null as run_source,
          false as created_by_service_account,
          client,
          api_client,
          cli_version
        from terraform_cloud.show_workspace
      ),
      paid_org_events as (
        select oe.*
        from
        org_events oe
        inner join
        ${tfc_organizations_subscriptions.SQL_TABLE_NAME} as s
        on oe.organization_id = s.organization_id
        and oe.event_at >= s.start_at and oe.event_at < s.end_at
        where
        oe.organization_id not in (select organization_id from ${tfc_internal_organizations.SQL_TABLE_NAME})
        and s.cost > 0
      )
      select * from paid_org_events
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: run_source {
    type: string
    sql: ${TABLE}.run_source ;;
  }

  dimension: created_by_service_account {
    type: string
    sql: ${TABLE}.created_by_service_account ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: api_client {
    type: string
    sql: ${TABLE}.api_client ;;
  }

  dimension: cli_version {
    type: string
    sql: ${TABLE}.cli_version ;;
  }

  set: detail {
    fields: [
      event_at_time,
      user_id,
      event,
      organization_id,
      organization,
      run_source,
      created_by_service_account,
      client,
      api_client,
      cli_version
    ]
  }
}
