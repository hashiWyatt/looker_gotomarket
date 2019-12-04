view: waterfall_conversions {
  derived_table: {
    sql:
SELECT *
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
      AND lower(lead_owner_c) != 'pre-sales'
    AND lower(lead_owner_c) != 'isaac wyatt'
      AND lead_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
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
      AND lower(lead_owner_c) != 'pre-sales'
      AND lower(lead_owner_c) != 'isaac wyatt'
      AND lower(lead_owner_c) != 'frank hane'
    AND sal_stage_date_c - INTERVAL '7 hours' >= '2019-02-01'
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
          AND type = 'New Business'
          AND created_date - INTERVAL '7 hours' > '2019-02-01'
    ) as opportunity_sqo_stage
    LEFT JOIN salesforce.users on (opportunity_sqo_stage.owner_id = users.id)
)
UNION
SELECT *
FROM (
  -- CWO
  SELECT
      id,
      close_date AS stage_date,
      owner_territory_c as region,
      'closed/won' as stage
      FROM salesforce.opportunities
        WHERE
          is_deleted = False
          AND close_date >= '2019-02-01'
          AND stage_name = 'Closed/Won'
          AND type = 'New Business'
)
UNION
SELECT *
FROM
  --Known Names
  (SELECT
  id,
  create_date_time_c - INTERVAL '7 hours' AS stage_date,
  lead_owner_region_c as region,
  'known name' as stage
  FROM salesforce.leads
  WHERE
    (mkto_71_acquisition_program_c ISNULL
    OR lower(mkto_71_acquisition_program_c) NOT LIKE '%terraform cloud%'
    )
    AND is_deleted = False
    AND create_date_time_c - INTERVAL '7 hours'>= '2019-02-01')
UNION
SELECT *
FROM
  (SELECT
  id,
  unqualified_stage_date_c - INTERVAL '7 hours' AS stage_date,
  lead_owner_region_c as region,
  'unqualified' as stage
  FROM salesforce.leads
  WHERE
    is_deleted = False
    AND status = 'Unqualified'
    AND Create_Date_Time_c >= '2018-02-01')
UNION
SELECT *
FROM
  (SELECT
  id,
  lead_stage_date_c - INTERVAL '7 hours' AS stage_date,
  lead_owner_region_c as region,
  'converted contact' as stage
  FROM salesforce.leads
  WHERE
  is_converted = True
  AND lower(lead_owner_c) != 'frank hane'
  AND lower(lead_owner_c) != 'isaac wyatt'
  AND lower(lead_owner_c) != 'pre-sales'
  AND lead_stage_date_c >= '2019-02-01')
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
