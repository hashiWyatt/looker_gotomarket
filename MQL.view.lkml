view: MQL {
  derived_table: {
    sql: SELECT
          lead_stage_date_c - INTERVAL '7 hours' AS lead_stage_date,
          id,
          lead_owner_c,
          Owner_Territory_c,
          Lead_Owner_Region_c,
          Lead_Owner_Job_Role_c,
          company,
          status
          FROM
          salesforce.leads
          WHERE
          lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
          AND is_deleted = False
          GROUP BY
          lead_stage_date,
          id,
          company,
          lead_owner_c,
          Owner_Territory_c,
          Lead_Owner_Region_c,
          Lead_Owner_Job_Role_c,
          status
 ;;
  }

  measure: MQLs {
    type: count
    drill_fields: [detail*]
  }

  measure: Unqualified {
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "Unqualified"
    }
  }

  measure: Qualified {
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "Qualified"
    }
  }

  dimension_group: lead_stage_date {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.lead_stage_date ;;
  }

  dimension: lead_owner {
    type: string
    sql: ${TABLE}.lead_owner_c ;;
  }

  dimension: lead_owner_job_role {
    type: string
    sql: ${TABLE}.Lead_Owner_Job_Role_c ;;
  }

  dimension: owner_territory {
    type: string
    sql: ${TABLE}.owner_territory_c ;;
  }

  dimension: lead_owner_region {
    type: string
    sql: ${TABLE}.lead_owner_region_c ;;
  }


  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [lead_owner, company, status, owner_territory, lead_owner_region, lead_owner_job_role]
  }
}
