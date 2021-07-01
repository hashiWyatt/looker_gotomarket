
view: terraform_practitioner_updated {
  sql_table_name: bi_stage.terraform_practitioner_updated ;;

  dimension: theater {
    type: string
    sql: ${TABLE}.theater ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.month ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: phase {
    type: string
    sql: ${TABLE}.phase ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count;;
    drill_fields: [count]
  }
}

explore: terraform_practitioner_updated  {
  label:  "Terraform Practitioner Geo"
}
