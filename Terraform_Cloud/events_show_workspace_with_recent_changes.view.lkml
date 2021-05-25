view: tfc_events_show_workspace_with_recent_changes {
  derived_table: {
    sql: with tfc_events_show_workspace_with_recent_changes as (
        -- only include show_workspace events that are within 4 days of a state change/applied run
        -- WARNING: this join will create duplicate rows. DISTINCT here though is likely non-performant
        -- when including in sub-queries. So be sure to de-dupe later
        select
          sw.*
        from terraform_cloud.show_workspace sw
        inner join terraform_cloud.state_version_created svc
        on sw.organization_id = svc.organization_id
        and sw.workspace = svc.workspace
        and sw.original_timestamp between svc.original_timestamp and (svc.original_timestamp + '4 days'::interval)
      )

      select
        original_timestamp as event_at,
        uuid,
        workspace,
        organization,
        context_library_name,
        event,
        user_id,
        client,
        plan,
        organization_id,
        api_client,
        cli_version
      from tfc_events_show_workspace_with_recent_changes
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

  dimension: uuid {
    type: number
    sql: ${TABLE}.uuid ;;
  }

  dimension: workspace {
    type: string
    sql: ${TABLE}.workspace ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
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
      uuid,
      workspace,
      organization,
      context_library_name,
      event,
      user_id,
      client,
      plan,
      organization_id,
      api_client,
      cli_version
    ]
  }
}
