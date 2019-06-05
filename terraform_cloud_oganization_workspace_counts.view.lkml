view: terraform_cloud_oganization_workspace_counts {
  derived_table: {
    sql: SELECT
    create_workspace.plan AS "plan",
    create_workspace.organization  AS "organization",
    COUNT(*) AS "workspace_count"
    FROM terraform_cloud.create_workspace  AS create_workspace
  GROUP BY create_workspace.organization, create_workspace.plan
  ORDER BY workspace_count DESC;;
 }

  dimension: plan {}
  dimension: organization {}
  dimension: workspace_count {}

  dimension: workspace_count_tier {
    type: tier
    tiers: [1,2,5,10]
    style: integer
    sql: ${workspace_count} ;;
  }

  measure:  count {
    type: count
  }
}
