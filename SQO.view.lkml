view: SQO {
  derived_table: {
    sql: SELECT
          opportunities.created_date - INTERVAL '7 hours'  AS created_date,
          opportunities.id,
          opportunities.owner_job_role_c,
          opportunities.owner_territory_c,
          opportunities.name,
          account_id,
          accounts.name,
          opportunities.created_by_id,
          users.name AS created_by_name,
          opportunities.owner_id,
          users2.name AS owner_name,
          amount
          FROM
          salesforce.opportunities
          LEFT JOIN
          salesforce.users
            ON users.id = opportunities.created_by_id
          LEFT JOIN
          salesforce.users users2
           ON users2.id = opportunities.owner_id
          LEFT JOIN
          salesforce.accounts
            ON opportunities.account_id = accounts.id
          WHERE
          opportunities.created_date - INTERVAL '7 hours' >= '2019-02-01'
          AND accounts.is_deleted = False
          GROUP BY
          opportunities.created_date,
          opportunities.id,
          opportunities.owner_job_role_c,
          opportunities.owner_territory_c,
          opportunities.name,
          account_id,
          accounts.name,
          opportunities.created_by_id,
          users.name,
          opportunities.owner_id,
          users2.name,
          amount
 ;;
  }

  measure: SQOs {
    type: count
    drill_fields: [detail*]
  }


  dimension_group: created_date {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: created_by_name {
    type: string
    sql: ${TABLE}.created_by_name ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: owner_territory {
    type: string
    sql: ${TABLE}.opportunities.owner_territory_c ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.opportunities.name ;;
  }


  dimension: account_name {
    type: string
    sql: ${TABLE}.accounts.name ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount;;
    value_format_name: usd
  }


  set: detail {
    fields: [created_by_name, owner_name, owner_territory, opportunity_name, account_name ]
  }
}
