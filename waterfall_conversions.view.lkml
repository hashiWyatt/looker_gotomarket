view: waterfall_conversions {
  derived_table: {
    sql: SELECT *
FROM (
    -- MQL stage
    SELECT
        id,
        lead_stage_date_c - INTERVAL '7 hours' AS stage_date,
        lead_owner_region_c as region,
        'mql' as stage
    FROM salesforce.leads
    WHERE
      is_deleted = False
      AND lead_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
)
UNION
SELECT *
FROM (
    -- SAL stage
    SELECT
        id,
        sal_stage_date_c - INTERVAL '7 hours' AS stage_date,
        lead_owner_region_c as region,
        'sal' as stage
    FROM salesforce.leads
    WHERE
      is_deleted = False
      AND sal_stage_date_c - INTERVAL '7 hours' >= '2019-03-01'
)
UNION
SELECT *
FROM (
    -- SQO
    SELECT
        opportunity_sqo_stage.id,
        opportunity_sqo_stage.stage_date,
        users.territory_c as region,
        opportunity_sqo_stage.stage
    FROM (
        SELECT
            id,
            created_date - INTERVAL '7 hours'
             AS stage_date,
            owner_id,
            'sqo' as stage
        FROM salesforce.opportunities
        WHERE
          is_deleted = False
          AND created_date - INTERVAL '7 hours' > '2019-03-01'
    ) as opportunity_sqo_stage
    LEFT JOIN salesforce.users on (opportunity_sqo_stage.owner_id = users.id)
)
UNION
SELECT *
FROM (
  SELECT
      id,
      close_date AS stage_date,
      owner_territory_c as region,
      'closed/won' as stage
      FROM salesforce.opportunities
        WHERE
          is_deleted = False
          AND close_date >= '2019-03-01'
          AND stage_name = 'Closed/Won'
)
       ;;
  }
  dimension:  id {
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  measure: count {
    type: count
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.stage_date ;;
  }

  dimension:  region {
    sql: ${TABLE}.region ;;
  }

  dimension:  stage {
    sql: ${TABLE}.stage;;
  }
}
