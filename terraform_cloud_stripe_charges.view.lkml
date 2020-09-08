view: terraform_cloud_stripe_charges {
  derived_table: {
    sql: select
          stripe.*,
          reporting.day,
          latest_billing_country.country,
          customer_info.organization_id,
          customer_info.organization,
          customer_info.email
        from
        ((select
            period_start as start_at,
            period_end as end_at,
            total::decimal(20,2)/100 as total_dollars,
            customer_id
          from
            tf_cloud_stripe.invoices
          where paid
        )
        union all
        (select
            current_period_start as start_at,
            current_period_end as end_at,
            (quantity::decimal(20,2) * amount::decimal(20,2))/100 as total_dollars,
            customer_id
          from
            tf_cloud_stripe.subscriptions, tf_cloud_stripe.plans
          where
            subscriptions.plan_id = plans.id
            and current_period_start >= date_trunc('month', getdate())
        ))
        as stripe
        inner join ${reporting_all_day_intervals.SQL_TABLE_NAME} as reporting
        on
        stripe.start_at <= reporting.day and stripe.end_at >= reporting.day
        left join (
          select customer_id, country from (
            select charges.customer_id, address_country as country, rank() over (partition by charges.customer_id order by charges.received_at desc) as rank from tf_cloud_stripe.charges, tf_cloud_stripe.cards where charges.card_id = cards.id
          ) where rank = 1
        ) as latest_billing_country
        on stripe.customer_id = latest_billing_country.customer_id
        left join (
          select customers.id, customers.email, create_organization.organization_id, create_organization.organization
          from tf_cloud_stripe.customers
          left join
          terraform_cloud.create_organization
          on customers.description = create_organization.organization_id
        ) as customer_info
        on stripe.customer_id = customer_info.id
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: total_dollars {
    type: number
    sql: ${TABLE}.total_dollars ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}.organization ;;
    link: {
      label: "Org Overview"
      url: "https://looker.hashicorp.services/dashboards/149?Org%20Name={{ organization_name | encode_uri }}"
    }
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  drill_fields: [detail*]

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }

  dimension_group: end_at {
    type: time
    sql: ${TABLE}.end_at ;;
  }

  dimension_group: reporting_day {
    type: time
    sql: ${TABLE}.day ;;
  }

  measure: sum_total_dollars {
    type: sum
    sql: ${total_dollars} ;;
  }

  set: detail {
    fields: [
      country,
      organization_name,
      organization_id,
      email,
      total_dollars,
      reporting_day_date
    ]
  }
}
