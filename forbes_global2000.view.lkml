view: forbes_global2000 {
  sql_table_name: hashicorp_internal_data.forbes_global2000 ;;

  dimension: assets {
    type: number
    sql: ${TABLE}.assets ;;
  }

  dimension: ceo {
    type: string
    sql: ${TABLE}.ceo ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: headquarters {
    type: string
    sql: ${TABLE}.headquarters ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: market_value {
    type: number
    sql: ${TABLE}.market_value ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: profits {
    type: number
    sql: ${TABLE}.profits ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
