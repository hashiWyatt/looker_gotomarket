view: terraform_cloud_salesforce_acv_waterfall {
  parameter: start_at {
    type: date
    label: "From date"
  }
  parameter: end_at {
    type: date
    label: "To"
  }
  derived_table: {
    sql:
      select
        coalesce(current.day, previous.day) as day,
        coalesce(current.name, previous.name) as name,
        coalesce(current.customer_id, previous.customer_id) as customer_id,
        current.acv as current_acv,
        case
          when current.acv = previous.acv then current.acv
          else (isnull(current.acv,0) - isnull(previous.acv,0))
        end as type_acv,
        --{% parameter start_at %} as start_at,
       -- {% parameter end_at %} as end_at,
        case
          when isnull(previous.acv,0) = 0 then 'new'
          when isnull(current.acv,0) = 0 then 'churned'
          when current.acv = previous.acv then 'unchanged'
          when current.acv > previous.acv then 'expansion'
          when previous.acv > current.acv then 'contraction'
        end as type
      from
        (select
          * from
          ${terraform_cloud_salesforce_bookings.SQL_TABLE_NAME}
          where day = {% parameter start_at %}
        ) as previous
      full outer join
        (select * from ${terraform_cloud_salesforce_bookings.SQL_TABLE_NAME}
          where day = {% parameter end_at %}
        ) as current
      on
        previous.customer_id = current.customer_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_type_acv {
    type: sum
    sql: ${TABLE}.type_acv ;;
  }

  dimension_group: day {
    type: time
    sql: ${TABLE}.day ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: current_acv {
    type: number
    sql: ${TABLE}.current_acv ;;
  }

  dimension: type_acv {
    type: number
    sql: ${TABLE}.type_acv ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  set: detail {
    fields: [
      day_time,
      name,
      customer_id,
      current_acv,
      type_acv,
      type
    ]
  }
}
