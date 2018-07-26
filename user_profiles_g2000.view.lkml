view: user_profiles_g2000 {
  derived_table: {
    sql: SELECT u.name, u.email, u.created_at, u.last_seen_at, u.domain, u.anonymous_ids, u.external_id, u.id, u.first_name, u.last_name FROM hull.user_profiles as u
      INNER JOIN hashicorp_internal_data.forbes_global2000 as g ON (u.domain = g.domain)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: last_seen_at {
    type: time
    sql: ${TABLE}.last_seen_at ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: anonymous_ids {
    type: string
    sql: ${TABLE}.anonymous_ids ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  set: detail {
    fields: [
      name,
      email,
      created_at_time,
      last_seen_at_time,
      domain,
      anonymous_ids,
      external_id,
      id,
      first_name,
      last_name
    ]
  }
}
