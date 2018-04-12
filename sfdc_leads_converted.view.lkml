view: sfdc_leads_converted {
  derived_table: {
    sql: SELECT l.id as lead_id, l.company,a.id as acc_id, a.name as acc_name ,o.id as opp_id, o.name as opp_name FROM salesforce.leads l
      inner join salesforce.accounts a on l.converted_account_id = a.id
      inner join salesforce.opportunities o on l.converted_opportunity_id = o.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}.lead_id ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: acc_id {
    type: string
    sql: ${TABLE}.acc_id ;;
  }

  dimension: acc_name {
    type: string
    sql: ${TABLE}.acc_name ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}.opp_id ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}.opp_name ;;
  }

  set: detail {
    fields: [
      lead_id,
      company,
      acc_id,
      acc_name,
      opp_id,
      opp_name
    ]
  }
}
