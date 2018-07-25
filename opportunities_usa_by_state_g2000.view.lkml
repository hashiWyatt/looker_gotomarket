view: opportunities_usa_by_state_g2000 {
  derived_table: {
    sql: SELECT COUNT(o.id), a.billing_state as state
      FROM salesforce.opportunities as o
      INNER JOIN salesforce.accounts as a ON (o.account_id = a.id)
      INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (a.website = g.domain)
      WHERE a.billing_country = 'United States'
      GROUP BY 2
       ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  set: detail {
    fields: [count, state]
  }
}
