view: tfc_organizations_funnel_signups_retention {
  derived_table: {
    sql:
      with
      signups as (
        select 'signups'::text as stage, count(distinct organization_id) as organizations from ${tfc_organizations_signups.SQL_TABLE_NAME} where start_at > getdate() - '7 days'::interval
      ),
      active_7 as (
        select 'active'::text as stage, count(distinct organization_id) as organizations from ${tfc_organizations_active.SQL_TABLE_NAME} where event_at > getdate() - '7 days'::interval
      ),
      active_cur as (
        select active_7.stage, active_7.organizations - signups.organizations as organizations
        from active_7
        cross join signups
      ),
      active_prev as (
        select 'active'::text as stage, count(distinct organization_id) as organizations from ${tfc_organizations_active.SQL_TABLE_NAME}
        where event_at > getdate() - '14 days'::interval and event_at <= getdate() - '7 days'::interval
      ),
      churned as (
        select 'churned' as stage, (b.organizations - a.organizations) as organizations
        from active_cur a, active_prev b where a.stage = b.stage
      )

      select stage, organizations from signups
      union
      select stage, organizations from active_cur
      union
      select stage, organizations * -1 from churned
       ;;
  }

  measure: sum {
    type: sum
    sql: ${organizations};;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension: organizations {
    type: number
    sql: ${TABLE}.organizations ;;
  }

  set: detail {
    fields: [stage, organizations]
  }


}
