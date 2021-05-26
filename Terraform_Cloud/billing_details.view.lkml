view: billing_details {
  derived_table: {
    sql:
      select
        c.description as organization_id,
        c.email as billing_email,
        cc.country
      from tfc_stripe.customer c
      inner join tfc_stripe.card cc
      on c.default_card_id = cc.id
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: billing_email {
    type: string
    sql: ${TABLE}.billing_email ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  set: detail {
    fields: [
      organization_id,
      billing_email,
      country
    ]
  }
}
