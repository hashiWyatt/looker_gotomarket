view: leads_usa_by_state_g2000 {
  derived_table: {
    sql: SELECT COUNT(l.id), l.state FROM salesforce.leads as l
      INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (l.website = g.domain)
      WHERE l.country = 'United States'
      GROUP BY l.state
       ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: state {
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  set: detail {
    fields: [count, state]
  }
}
