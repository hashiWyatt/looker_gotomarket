view: mbr_lead_progression {
  derived_table: {
    sql: WITH names as (
      select owner_account_segment, owner_account_theater, created_date_pst, 'Names' as measure, true as value
      from bi.leads
      ),

      mals as (
      select owner_account_segment, owner_account_theater, created_date_pst, 'MALs' as measure
      , case when status in ('New', 'Converted to Opportunity', 'Converted Contact to Account', 'Sales Accepted (SAL)', 'Qualified', 'Unqualified', 'Working', 'Marketing Prospect')
      then true else false end as value
      from bi.leads
      ),

mqls as (
      select owner_account_segment, owner_account_theater, lead_stage_date_pst as created_date_pst, 'MQLs' as measure
      , lead_stage_date is not null as value
      from bi.leads
      ),

      sals_working as (
      select owner_account_segment, owner_account_theater, lead_stage_date_pst as created_date_pst, 'SALs (Working)' as measure
      , status in ('Working') as  value
      from bi.leads
      ),

      sals_responded as (
      select owner_account_segment, owner_account_theater, lead_stage_date_pst as created_date_pst, 'SALs (Accepted)' as measure
      , status in ('Sales Accepted (SAL)') as  value
      from bi.leads
      ),
      sqos as (
      select owner_segment, owner_theater, created_date_pst, 'SQOs' as measure
      , is_sqo as value
      from bi.opportunities
      )

      select * from names
      union all select * from mals
      union all select * from mqls
      union all select * from sals_working
      union all select * from sals_responded
      union all select * from sqos
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: owner_account_segment {
    type: string
    sql: ${TABLE}.owner_account_segment ;;
    order_by_field: owner_account_segment_sort
  }

dimension: owner_account_segment_sort {
  type:  number
  sql:  CASE WHEN ${owner_account_segment} = 'G1' THEN 1
  WHEN ${owner_account_segment} = 'E1' THEN 2
  WHEN ${owner_account_segment} = 'E2' THEN 3
  WHEN ${owner_account_segment} = 'C1' THEN 4
  ELSE 5 END;;
}

  dimension: owner_account_theater {
    type: string
    sql: ${TABLE}.owner_account_theater ;;
  }

  dimension_group: created_date_pst {
    type: time
    sql: ${TABLE}.created_date_pst ;;
  }


  dimension: measure {
    type: string
    sql: ${TABLE}.measure ;;
  }

  dimension: measure_sort {
    case: {
      when: {
        sql: ${measure} = 'Names' ;;
        label: "Names"
      }
      when: {
        sql: ${measure} = 'MALs' ;;
        label: "MALs"
      }
      when: {
        sql: ${measure} = 'MQLs' ;;
        label: "MQLs"
      }
      when: {
        sql: ${measure} = 'SALs (Working)' ;;
        label: "SALs (Working)"
      }
      when: {
        sql: ${measure} = 'SALs (Accepted)' ;;
        label: "SALs (Accepted)"
      }
      when: {
        sql: ${measure} = 'SQOs' ;;
        label: "SQOs"
      }
    }
  }

  measure: value {
    type: sum
    sql: ${TABLE}.value::int ;;
  }

  set: detail {
    fields: [owner_account_segment, owner_account_theater, created_date_pst_time, measure, value]
  }
}
