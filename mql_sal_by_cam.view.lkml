view: revenue_metrics_by_cam {
  derived_table: {
    sql: SELECT
         mql.mql_month AS month,
         mql.mql_lead_owner AS lead_owner,
         num_mql,
         mql_qualified,
         mql_unqualified,
         num_sal,
         num_sal_qualified,
         num_sal_unqualified,
         num_sqo,
         num_cwo_by_cam,
         closed_won_amount,
         num_closed_lost_by_cam,
         closed_lost_amount
      FROM
         (
            SELECT
               date_trunc( 'month', lead_stage_date_c - INTERVAL '7 hours' ) AS mql_month,
               lead_owner_c AS mql_lead_owner,
               count( distinct(id) ) AS num_mql
            FROM
               salesforce.leads
            WHERE
               lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
               AND lower(Owner_Territory_c) = 'inside sales'
               AND is_deleted = False
               AND
                  (
                     lead_owner_c = 'Alex Ponce'
                     OR lead_owner_c = 'Jeremy Truvillion'
                     OR lead_owner_c = 'Nedim Mekanic'
                     OR lead_owner_c = 'Samantha Lee'
                  )
            GROUP BY
               mql_month,
               lead_owner_c
         )
         mql
         LEFT JOIN
         (
            SELECT
               date_trunc( 'month', lead_stage_date_c - INTERVAL '7 hours' ) AS mql_month,
               lead_owner_c AS mql_lead_owner,
               count( distinct(id) ) AS mql_unqualified
            FROM
               salesforce.leads
            WHERE
               lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
               AND lower(Owner_Territory_c) = 'inside sales'
               AND is_deleted = False
               AND status = 'Unqualified'
            GROUP BY
               mql_month,
               lead_owner_c
         )
         mql_unqualified
         ON mql.mql_month = mql_unqualified.mql_month
         AND mql.mql_lead_owner = mql_unqualified.mql_lead_owner
         LEFT JOIN
         (
            SELECT
               date_trunc( 'month', lead_stage_date_c - INTERVAL '7 hours' ) AS mql_month,
               lead_owner_c AS mql_lead_owner,
               count( distinct(id) ) AS mql_qualified
            FROM
               salesforce.leads
            WHERE
               lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
               AND lower(Owner_Territory_c) = 'inside sales'
               AND is_deleted = False
               AND status = 'Qualified'
            GROUP BY
               mql_month,
               lead_owner_c
         ) mql_qualified
         ON mql.mql_month = mql_qualified.mql_month
         AND mql.mql_lead_owner = mql_qualified.mql_lead_owner
         LEFT JOIN
            (
               SELECT
                  date_trunc( 'month', sal_stage_date_c - INTERVAL '7 hours' ) AS sal_month,
                  lead_owner_c AS sal_lead_owner,
                  count( distinct(id) ) AS num_sal
               FROM
                  salesforce.leads
               WHERE
                  sal_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
                  AND lower(Owner_Territory_c) = 'inside sales'
                  AND is_deleted = False
               GROUP BY
                  sal_month,
                  lead_owner_c
            )
            sal
            ON mql.mql_month = sal.sal_month
            AND mql.mql_lead_owner = sal.sal_lead_owner
         LEFT JOIN
         (
               SELECT
                  date_trunc( 'month', sal_stage_date_c - INTERVAL '7 hours' ) AS sal_month,
                  lead_owner_c AS sal_lead_owner,
                  count( distinct(id) ) AS num_sal_qualified
               FROM
                  salesforce.leads
               WHERE
                  sal_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
                  AND lower(Owner_Territory_c) = 'inside sales'
                  AND is_deleted = False
                  AND status = 'Qualified'
               GROUP BY
                  sal_month,
                  lead_owner_c
            )
            sal_qualified
            ON mql.mql_month = sal_qualified.sal_month
            AND mql.mql_lead_owner = sal_qualified.sal_lead_owner
         LEFT JOIN
         (
               SELECT
                  date_trunc( 'month', sal_stage_date_c - INTERVAL '7 hours' ) AS sal_month,
                  lead_owner_c AS sal_lead_owner,
                  count( distinct(id) ) AS num_sal_unqualified
               FROM
                  salesforce.leads
               WHERE
                  sal_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
                  AND lower(Owner_Territory_c) = 'inside sales'
                  AND is_deleted = False
                  AND status = 'Unqualified'
               GROUP BY
                  sal_month,
                  lead_owner_c
            )
            sal_unqualified
            ON mql.mql_month = sal_unqualified.sal_month
            AND mql.mql_lead_owner = sal_unqualified.sal_lead_owner
         LEFT JOIN
             (
             SELECT
         date_trunc( 'month', opportunities.created_date - INTERVAL '7 hours'  ) AS sqo_month,
         users.name AS sqo_name,
         count( distinct(opportunities.id) ) AS num_sqo
      FROM
         salesforce.opportunities
         LEFT JOIN
            salesforce.users
            ON opportunities.created_by_id = users.id
      WHERE
         opportunities.created_date >= '2019-02-01'
         AND opportunities.is_deleted = False
      GROUP BY
         sqo_month,
         sqo_name
             ) sqo
             ON mql.mql_month = sqo.sqo_month
            AND mql.mql_lead_owner = sqo.sqo_name
         LEFT JOIN
            (
               SELECT
                  date_trunc('month', close_date) AS cwo_by_cam_month,
                  users.name AS cwo_cam_name,
                  count( distinct(opportunities.id) ) AS num_cwo_by_cam,
                  sum(amount) AS closed_won_amount
               FROM
                  salesforce.opportunities
                  LEFT JOIN
                     salesforce.users
                     ON opportunities.created_by_id = users.id
               WHERE
                  stage_name = 'Closed/Won'
                  AND close_date >= '2019-02-01'
                  AND opportunities.is_deleted = False
                  AND
                  (
                     users.name = 'Alex Ponce'
                     OR users.name = 'Jeremy Truvillion'
                     OR users.name = 'Nedim Mekanic'
                     OR users.name = 'Samantha Lee'
                  )
               GROUP BY
                  cwo_by_cam_month,
                  users.name
            )
            AS CWO
            ON mql.mql_month = CWO.cwo_by_cam_month
            AND mql.mql_lead_owner = CWO.cwo_cam_name
         LEFT JOIN
            (
               SELECT
                  date_trunc('month', close_date) AS closed_lost_by_cam_month,
                  users.name AS closed_lost_cam_name,
                  count( distinct(opportunities.id) ) AS num_closed_lost_by_cam,
                  sum(amount) AS closed_lost_amount
               FROM
                  salesforce.opportunities
                  LEFT JOIN
                     salesforce.users
                     ON opportunities.created_by_id = users.id
               WHERE
                  stage_name = 'Closed/Lost'
                  AND close_date >= '2019-02-01'
                  AND opportunities.is_deleted = False
                  AND
                  (
                     users.name = 'Alex Ponce'
                     OR users.name = 'Jeremy Truvillion'
                     OR users.name = 'Nedim Mekanic'
                     OR users.name = 'Samantha Lee'
                  )
               GROUP BY
                  closed_lost_by_cam_month,
                  users.name
            )
            AS closed_lost
            ON mql.mql_month = closed_lost.closed_lost_by_cam_month
            AND mql.mql_lead_owner = closed_lost.closed_lost_cam_name
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

  measure: num_mql {
    type: max
    sql: ${TABLE}.num_mql ;;
  }

  measure: mql_qualified {
    type: max
    sql: ${TABLE}.mql_qualified ;;
  }

  measure: mql_unqualified {
    type: max
    sql: ${TABLE}.mql_unqualified ;;
  }

  measure: num_sal {
    type: max
    sql: ${TABLE}.num_sal ;;
  }

  measure: num_sal_qualified {
    type: max
    sql: ${TABLE}.num_sal_qualified ;;
  }

  measure: num_sal_unqualified {
    type: max
    sql: ${TABLE}.num_sal_unqualified ;;
  }

  measure: num_sqo {
    type: max
    sql: ${TABLE}.num_sqo ;;
  }

  measure: num_cwo_by_cam {
    type: max
    sql: ${TABLE}.num_cwo_by_cam ;;
  }

  measure: closed_won_amount {
    type: max
    sql: ${TABLE}.closed_won_amount ;;
  }

  measure: num_closed_lost_by_cam {
    type: max
    sql: ${TABLE}.num_closed_lost_by_cam ;;
  }

  measure: closed_lost_amount {
    type: max
    sql: ${TABLE}.closed_lost_amount ;;
  }

  set: detail {
    fields: [
      month_time,
      lead_owner,
      num_mql,
      mql_qualified,
      mql_unqualified,
      num_sal,
      num_sal_qualified,
      num_sal_unqualified,
      num_sqo,
      num_cwo_by_cam,
      closed_won_amount,
      num_closed_lost_by_cam,
      closed_lost_amount
    ]
  }
}
