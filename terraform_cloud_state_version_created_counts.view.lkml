view: terraform_cloud_state_version_created_counts {
  derived_table: {
    sql: SELECT
            state_version_created.plan AS "plan",
            state_version_created.organization  AS "organization",
            COUNT(*) AS "state_version_created_count"
            FROM terraform_cloud.state_version_created  AS state_version_created
             WHERE
              (((state_version_created.timestamp ) >= ((DATEADD(day,-29, DATE_TRUNC('day',GETDATE()) ))) AND (state_version_created.timestamp ) < ((DATEADD(day,30, DATEADD(day,-29, DATE_TRUNC('day',GETDATE()) ) )))))
          GROUP BY state_version_created.organization, state_version_created.plan
          ORDER BY state_version_created_count DESC;;
  }

  dimension: plan {}
  dimension: organization {}
  dimension: state_version_created_count {
    type: number
  }

  dimension: state_version_created_count_tier {
    type: tier
    tiers: [1,2,5,10,25,50,100,200]
    style: integer
    sql: ${state_version_created_count} ;;
  }

  measure: count {
    type: count
  }
}
