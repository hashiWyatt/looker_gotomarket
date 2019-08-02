view: mql_sal_by_cam {
  derived_table: {
    sql: SELECT mql_month AS month,
      mql_lead_owner AS lead_owner,
      num_mql,
      num_sal
      FROM
      (SELECT
              date_trunc(
                'month', lead_stage_date_c - INTERVAL '7 hours'
              ) AS mql_month,
              lead_owner_c AS mql_lead_owner,
              count(
                distinct(id)
              ) AS num_mql
            FROM
              salesforce.leads
            WHERE
              lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
              AND lower(Owner_Territory_c) = 'inside sales'
              AND is_deleted = False
            GROUP BY
              mql_month, lead_owner_c) mql
              LEFT JOIN (
                SELECT
                date_trunc(
                  'month', sal_stage_date_c - INTERVAL '7 hours'
                ) AS sal_month,
                lead_owner_c AS sal_lead_owner,
                count(
                  distinct(id)
                ) AS num_sal
              FROM
                salesforce.leads
              WHERE
                sal_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
                AND lower(Owner_Territory_c) = 'inside sales'
                AND is_deleted = False
              GROUP BY
                sal_month, lead_owner_c
                ) sal
                ON mql.mql_month = sal.sal_month AND mql.mql_lead_owner = sal.sal_lead_owner
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

  dimension: lead_owner {
    type: string
    sql: ${TABLE}.lead_owner ;;
  }

  dimension: num_mql {
    type: number
    sql: ${TABLE}.num_mql ;;
  }

  dimension: num_sal {
    type: number
    sql: ${TABLE}.num_sal ;;
  }

  set: detail {
    fields: [month_time, lead_owner, num_mql, num_sal]
  }
}
