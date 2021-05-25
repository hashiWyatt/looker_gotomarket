view: tfc_users_activity {
  derived_table: {
    sql:
      select
        t.original_timestamp as event_at,
        t.event,
        t.user_id,
        case
          when t.original_timestamp > coalesce(s.created_at, '2018-01-01'::timestamp) then false
          else true
        end as new_signup
      from terraform_cloud.tracks t
      left join
      ${tfc_users_signups.SQL_TABLE_NAME} s
      on t.user_id = s.user_id
      where t.user_id not in (select user_id from ${tfc_internal_users.SQL_TABLE_NAME})
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_users {
    type: count_distinct
    sql:  ${TABLE}.user_id ;;
  }


  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: new_signup {
    type: yesno
    sql:  ${TABLE}.new_signup ;;
  }

  set: detail {
    fields: [
      event_at_time,
      user_id,
      event
    ]
  }
}
