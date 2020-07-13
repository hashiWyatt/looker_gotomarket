view: terraform_cloud_state_version_viewed_counts {
    derived_table: {
      sql: SELECT
            state_version_show.plan AS "plan",
            state_version_show.organization  AS "organization",
            COUNT(*) AS "state_version_show_count"
            FROM terraform_cloud.state_version_show  AS state_version_show
            WHERE
              (((state_version_show.timestamp ) >= ((DATEADD(day,-29, DATE_TRUNC('day',GETDATE()) ))) AND (state_version_show.timestamp ) < ((DATEADD(day,30, DATEADD(day,-29, DATE_TRUNC('day',GETDATE()) ) )))))
          GROUP BY state_version_show.organization, state_version_show.plan
          ORDER BY state_version_show_count DESC;;
    }

    dimension: plan {}
    dimension: organization {}
    dimension: state_version_show_count {}

    dimension: state_version_show_count_tier {
      type: tier
      tiers: [1,2,5,10,25,50,100,200]
      style: integer
      sql: ${state_version_show_count} ;;
    }

    measure: count {
      type: count
    }
  }