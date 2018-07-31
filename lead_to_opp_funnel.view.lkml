view: lead_to_opp_funnel {
  derived_table: {
    sql: SELECT
        created_leads.id as lead_id,
        created_leads.created_date as created_lead,
        converted_leads.converted_date as converted_lead,
        won_opps.close_date as won_opp,
        reps.name as rep,
        created_leads.lead_product_c as product,
        created_leads.country as country
      FROM
        -- Created leads
        (SELECT *
          FROM salesforce.leads) as created_leads
        LEFT JOIN
        -- Converted leads
        (SELECT *
          FROM salesforce.leads
          WHERE converted_date IS NOT NULL) as converted_leads
        ON created_leads.id = converted_leads.id
        -- Closed/Won Opps
        LEFT JOIN
        (SELECT *
          FROM salesforce.opportunities
          WHERE close_date IS NOT NULL AND is_won = true) AS won_opps
        ON won_opps.id = converted_leads.converted_opportunity_id
        -- Reps
        LEFT JOIN
        (SELECT *
          FROM salesforce.users) as reps
        ON reps.id = created_leads.owner_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: lead_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.lead_id ;;
  }

  dimension_group: created_lead {
    type: time
    sql: ${TABLE}.created_lead ;;
  }

  dimension_group: converted_lead {
    type: time
    sql: ${TABLE}.converted_lead ;;
  }

  dimension_group: won_opp {
    type: time
    sql: ${TABLE}.won_opp ;;
  }

  dimension: sales_rep {
    type: string
    sql:  ${TABLE}.rep ;;
  }

  dimension: product {
    type:  string
    sql:  ${TABLE}.product ;;
  }

  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }

  set: detail {
    fields: [lead_id, created_lead_time, converted_lead_time, won_opp_time]
  }

  measure: created_lead_count {
    type:  count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: {
      field: created_lead_month
      value: "NOT NULL"
    }

  }

  measure: converted_lead_count {
    type:  count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: {
      field: converted_lead_month
      value: "NOT NULL"
    }

  }

  measure: won_opp_count {
    type:  count_distinct
    sql: ${TABLE}.lead_id ;;
    filters: {
      field: won_opp_month
      value: "NOT NULL"
    }

  }
}
