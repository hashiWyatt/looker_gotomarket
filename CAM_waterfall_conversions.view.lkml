view: cam_waterfall_conversions {
  derived_table: {
    sql: SELECT
        lead_stage_date AS day_date,
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
                'day', lead_stage_date_c - INTERVAL '7 hours'
              ) AS lead_stage_date,
              count(
                distinct(id)
              ) AS MQL_count
            FROM
              salesforce.leads
            WHERE
              is_deleted = False
              AND lead_owner_region_c = 'Inside Sales'
              AND lead_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
            GROUP BY
              lead_stage_date
          ) mql
          LEFT JOIN (
            SELECT
              date_trunc(
                'day', sal_stage_date_c - INTERVAL '7 hours'
              ) AS sal_stage_date,
              count(
                distinct(id)
              ) AS SAL_count
            FROM
              salesforce.leads
            WHERE
              is_deleted = False
              AND lead_owner_region_c = 'Inside Sales'
              AND sal_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
            GROUP BY
              sal_stage_date
          ) sal ON mql.lead_stage_date = sal.sal_stage_date
          LEFT JOIN (
            SELECT
              date_trunc(
                'day', created_date - INTERVAL '7 hours'
              ) AS sqo_date,
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
                  territory_c = 'Inside Sales'
              )
              AND is_deleted = False
              AND created_date - INTERVAL '7 hours' > '2019-03-01'
            GROUP BY
              sqo_date
          ) sqo ON sal.sal_stage_date = sqo.sqo_date
          LEFT JOIN (
            SELECT
              date_trunc('day', close_date) AS close_date,
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
                  territory_c = 'Inside Sales'
              )
            GROUP BY
              close_date
          ) cwo ON sqo.sqo_date = cwo.close_date
        )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.day_date ;;
  }

  measure: mql_count {
    type: sum
    sql: ${TABLE}.mql_count ;;
  }

  measure: sal_count {
    type: sum
    sql: ${TABLE}.sal_count ;;
  }

  measure: sqo_count {
    type: sum
    sql: ${TABLE}.sqo_count ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: cwo_count {
    type: sum
    sql: ${TABLE}.cwo_count ;;
  }

  measure: y1_acv_won {
    type: sum
    sql: ${TABLE}.y1_acv_won ;;
    value_format_name: usd
  }

  set: detail {
    fields: [
      date_date,
      mql_count,
      sal_count,
      sqo_count,
      amount,
      cwo_count,
      y1_acv_won
    ]
  }
}
