connection: "cdp"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: cloud_organization_c {
  join: cloud_organization_member_c {
    relationship: many_to_one
    sql_on: ${cloud_organization_c.id} = ${cloud_organization_member_c.sfdc_cloud_organization_c} ;;
  }

  join: cloud_organization_usage_c {
    relationship: many_to_one
    sql_on: ${cloud_organization_c.id} = ${cloud_organization_usage_c.sfdc_cloud_organization_c} ;;
  }


  join: cloud_organization_opportunity_c {
    relationship: many_to_one
    sql_on: ${cloud_organization_c.id} = ${cloud_organization_opportunity_c.sfdc_cloud_organization_c} ;;
  }

}

explore: g2k_matched_accounts_tfc {}

explore: g2k_matched_accounts_hcp {}

explore: paid_tier_sfdc_matches {}
