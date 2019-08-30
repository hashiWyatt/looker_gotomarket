view: apac_waterfall_conversions {
  derived_table: {
    sql: SELECT
        lead_stage_month AS month,
        MQL_count,
        sal_count,
        sqo_count,
        amount,
        cwo_count,
        y1_acv_won
      FROM
        (
          (
            SELECT
              date_trunc(
                'month', lead_stage_date_c - INTERVAL '7 hours'
              ) AS lead_stage_month,
              count(
                distinct(id)
              ) AS MQL_count
            FROM
              salesforce.leads
            WHERE
              is_deleted = False
              AND lead_owner_region_c = 'APAC'
              AND lead_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
            GROUP BY
              lead_stage_month
          ) mql
          LEFT JOIN (
            SELECT
              date_trunc(
                'month', sal_stage_date_c - INTERVAL '7 hours'
              ) AS sal_stage_month,
              count(
                distinct(id)
              ) AS SAL_count
            FROM
              salesforce.leads
            WHERE
              is_deleted = False
              AND lead_owner_region_c = 'APAC'
              AND sal_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
            GROUP BY
              sal_stage_month
          ) sal ON mql.lead_stage_month = sal.sal_stage_month
          LEFT JOIN (
            SELECT
              date_trunc(
                'month', created_date - INTERVAL '7 hours'
              ) AS sqo_month,
              count(
                distinct(id)
              ) AS SQO_count,
              sum(amount) AS amount
            FROM
              salesforce.opportunities
            WHERE
              owner_id in (
                SELECT
                  id
                FROM
                  salesforce.users
                WHERE
                  territory_c = 'APAC'
              )
              AND is_deleted = False
              AND created_date - INTERVAL '7 hours' > '2019-03-01'
            GROUP BY
              sqo_month
          ) sqo ON sal.sal_stage_month = sqo.sqo_month
          LEFT JOIN (
            SELECT
              date_trunc('month', close_date) AS close_month,
              count(
                distinct(id)
              ) AS CWO_count,
              sum(y_1_acv_c) AS y1_acv_won
            FROM
              salesforce.opportunities
            WHERE
              is_deleted = False
              AND close_date - INTERVAL '7 hours' >= '2019-03-01'
              AND stage_name = 'Closed/Won'
              AND owner_id in (
                SELECT
                  id
                FROM
                  salesforce.users
                WHERE
                  territory_c = 'APAC'
              )
            GROUP BY
              close_month
          ) cwo ON sqo.sqo_month = cwo.close_month
        )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month ;;
  }

  measure: mql_count {
    type: max
    sql: ${TABLE}.mql_count ;;
  }

  measure: sal_count {
    type: max
    sql: ${TABLE}.sal_count ;;
  }

  measure: sqo_count {
    type: max
    sql: ${TABLE}.sqo_count ;;
  }

  measure: amount {
    type: max
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: cwo_count {
    type: max
    sql: ${TABLE}.cwo_count ;;
  }

  measure: y1_acv_won {
    type: max
    sql: ${TABLE}.y1_acv_won ;;
    value_format_name: usd
  }

  set: detail {
    fields: [
      month_time,
      mql_count,
      sal_count,
      sqo_count,
      amount,
      cwo_count,
      y1_acv_won
    ]
  }
}
