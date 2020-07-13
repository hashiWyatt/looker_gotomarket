view: terraform_cloud_stripe_acv_waterfall {
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
        coalesce(current.customer_id, previous.customer_id) as customer_id,
        current.total_dollars*12 as current_acv,
        case
          when current.total_dollars = previous.total_dollars then current.total_dollars * 12
          else (isnull(current.total_dollars,0) - isnull(previous.total_dollars,0)) * 12
        end as type_acv,
        case
          when isnull(previous.total_dollars,0) = 0 then 'new'
          when isnull(current.total_dollars,0) = 0 then 'churned'
          when current.total_dollars = previous.total_dollars then 'starting'
          when current.total_dollars > previous.total_dollars then 'expansion'
          when previous.total_dollars > current.total_dollars then 'contraction'
        end as type
      from
        (select
          * from
          ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
          where day = {% parameter start_at %}
        ) as previous
      full outer join
        (select * from ${terraform_cloud_stripe_charges.SQL_TABLE_NAME}
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
