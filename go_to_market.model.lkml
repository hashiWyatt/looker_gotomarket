connection: "cdp"

# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

fiscal_month_offset: -11

# explore: _group {}

explore: accounts {
  join: opportunities{
    type: left_outer
    sql_on: ${accounts.id} = ${opportunities.account_id} ;;
    relationship: one_to_many
  }
  join: owner {
    from:  users
    type: left_outer
    sql_on: ${owner.id} = ${opportunities.owner_id} ;;
    relationship: many_to_one
  }
  join: opportunity_product {
    type: left_outer
    sql_on: ${opportunity_product.opportunity_id}= ${opportunities.id} ;;
    relationship: one_to_many
  }
  join: products {
    type: left_outer
    sql_on: ${opportunity_product.product_2_id}= ${products.id} ;;
    relationship: one_to_one
  }

  join: forbes_global2000 {
    type:  left_outer
    sql_on: ${forbes_global2000.domain} = ${accounts.website} ;;
    relationship: one_to_many
  }
}

# explore: campaign_members {
#   join: contacts {
#     type: left_outer
#     sql_on: ${campaign_members.contact_id} = ${contacts.id} ;;
#     relationship: many_to_one
#   }

#   join: campaigns {
#     type: left_outer
#     sql_on: ${campaign_members.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }

#   join: leads {
#     type: left_outer
#     sql_on: ${campaign_members.lead_id} = ${leads.id} ;;
#     relationship: many_to_one
#   }
#
#   join: accounts {
#     type: left_outer
#     sql_on: ${contacts.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: campaigns {}

 explore: contacts {
   join: accounts {
     type: left_outer
     sql_on: ${contacts.account_id} = ${accounts.id} ;;
     relationship: many_to_one
   }
 }
#
# explore: contracts {
#   join: accounts {
#     type: left_outer
#     sql_on: ${contracts.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: dashboards {}
#
# explore: documents {}
#
# explore: events {
#   join: accounts {
#     type: left_outer
#     sql_on: ${events.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }

explore: leads {
  join: tasks {
    type: left_outer
    sql_on: ${leads.id} = ${tasks.who_id} ;;
    relationship: one_to_many
  }

  join: users {
    type: left_outer
    sql_on: ${users.id} = ${leads.owner_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${role.id} = ${users.user_role_id} ;;
    relationship: many_to_one
  }

  join: forbes_global2000 {
    type: left_outer
    sql_on: ${forbes_global2000.domain} = ${leads.website} ;;
    relationship: one_to_many
  }

  join: opportunities {
    type: left_outer
    sql_on: ${leads.converted_opportunity_id} = ${opportunities.id} ;;
    relationship: one_to_many
  }
  }

  explore: sla_first_touch {}
#     type: :left_outer
#     sql_on: ${leads.id} = ${sla_first_touch.count_leads} ;;
#     relationship: one_to_many

  explore: sla_first_response {}


# explore: notes {}
#
explore: opportunities {
  join: accounts {
    type: left_outer
    sql_on: ${opportunities.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }
  join: opportunity_stage {
    type: left_outer
    sql_on: ${opportunities.stage_name} = ${opportunity_stage.api_name} ;;
    relationship: one_to_many
  }
  join: opportunity_product {
    type: left_outer
    sql_on: ${opportunity_product.opportunity_id}= ${opportunities.id} ;;
    relationship: one_to_many
  }
  join: products {
    type: left_outer
    sql_on: ${opportunity_product.product_2_id}= ${products.id} ;;
    relationship: one_to_one
  }

  join: owner {
    from:  users
    type: left_outer
    sql_on: ${owner.id} = ${opportunities.owner_id} ;;
    relationship: many_to_one
  }

  join: created_by {
    from:  users
    type: left_outer
    sql_on: ${created_by.id} = ${opportunities.created_by_id} ;;
    relationship: many_to_one
  }

  join: opportunity_product_fullinfo {
    type: left_outer
    sql_on: ${opportunity_product_fullinfo.opportunity_id}= ${opportunities.id} ;;
    relationship: one_to_many
  }
  join: leads {
    type: left_outer
    sql_on: ${leads.converted_opportunity_id} = ${opportunities.id} ;;
    relationship: many_to_one
  }
  join: opportunity_lead_conversiontimes {
    type: left_outer
    sql_on: ${opportunity_lead_conversiontimes.op_id}= ${opportunities.id} ;;
    relationship: one_to_many
  }
  }
# explore: opportunities {
#   join: campaigns {
#     type: left_outer
#     sql_on: ${opportunities.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }

# explore: opportunity_contact_role {
#   join: contacts {
#     type: left_outer
#     sql_on: ${opportunity_contact_role.contact_id} = ${contacts.id} ;;
#     relationship: many_to_one
#   }
#
#   join: accounts {
#     type: left_outer
#     sql_on: ${contacts.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: opportunity_field_history {}
#
# explore: opportunity_history {}
#
explore: opportunity_product {
  join: products{
    type: left_outer
    sql_on: ${products.id} = ${opportunity_product.product_2_id} ;;
    relationship: many_to_many
    }
  }
#
# explore: opportunity_stage {}
#
# explore: period {}
#
explore: price_book_entries {}
#
explore: price_books {}
#
explore: products {
  join: price_book_entries{
    type: left_outer
    sql_on: ${products.id} = ${price_book_entries.product_2_id} ;;
    relationship: one_to_many
    }
    }
#
# explore: profile {}
#
# explore: role {}
#
# explore: tasks {
#   join: accounts {
#     type: left_outer
#     sql_on: ${tasks.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: user_login {
#   join: users {
#     type: left_outer
#     sql_on: ${user_login.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
#
#   join: profile {
#     type: left_outer
#     sql_on: ${users.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: users {
#   join: profile {
#     type: left_outer
#     sql_on: ${users.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }
# }

# explore:  salesforce_qualified_leads{}
explore:  content_blog_pages {
  label: "Content: Blog Pages"
}
explore:  content_resource_pages {
  label: "Content: Resource Pages"
}
explore:  clearbit_companies {
  label: "Clearbit Companies"
}
explore:  sfdc_account_superview {
  label: "SFDC Account OSS-TFC-HCS Superview (VERY SLOW - Full OSS download data for trailing 180 days)"
}

explore:  oss_downloads {
  label: "OSS Downloads"
}
explore:  enriched_oss_downloads {
  label: "Enriched OSS Downloads"
}

explore:  enriched_oss_downloads_sfdc {
  label: "Enriched OSS Downloads SFDC"
}

explore: enriched_product_pageviews {
  label: "Enriched Product Pageviews"
}
explore:  datocms_publishes {
  label: "DatoCMS Publishes"
}
explore:  named_account_penetration {
  label: "Named Account Penetration"
}

explore: monthly_funnel_metrics {
  label: "Monthly Funnel Metrics"
}

explore: cam_monthly_funnel_metrics {
  label: "CAM Monthly Funnel Metrics"
}

explore: weekly_funnel_metrics {
  label: "Weekly Funnel Metrics"
}

explore: mqls_by_product {
  label: "MQLs by Product"
}

explore:  product_learn_unique_visitors {
  label: "Learn Unique Visitors"
}

explore:  product_io_unique_visitors {
  label: ".io Unique Visitors"
}

explore:  opportunity_revenue_amounts {
  label: "Opportunity Revenue"
}

explore: revenue_metrics_by_cam {
  label: "Monthly MQL, SAL, SQO, Closed by CAM"
}

explore: revenue_metrics_by_name {
  label: "Monthly MQL, SAL, SQO, Closed by Lead Owner Name"
}

explore: closed_opportunities {
  label: "Closed Opportunities"
}

explore: leads_per_product {
  label: "Leads Per Product"
}

explore: unqualified_leads_per_product {
  label: "Unqualified Leads Per Product"
}


explore:  leads_newworking_g2000 {}
explore:  leads_qualified_g2000 {}
explore:  opportunities_created_g2000 {}
explore:  opportunities_closedwon_g2000 {}
explore:  customers_created_g2000 {}
explore:  leads_usa_by_state_g2000 {}
explore:  opportunities_usa_by_state_g2000 {}
explore:  user_profiles_g2000 {
  label: "Hull User Profiles (G2000)"
}

explore:  user_profiles {
  label: "Hull User Profiles"
  join: forbes_global2000 {
    type: left_outer
    sql_on: ${forbes_global2000.domain} = ${user_profiles.domain} ;;
    relationship: one_to_many
  }
}

explore:  lead_to_opp_funnel {}

explore:terraform_cloud_signup_funnel_pageviews {
  label: "Terraform Cloud Signup Funnel Pageviews"
}

explore:  terraform_cloud_sales_rollup {
  label: "Terraform Cloud Sales Rollup"
}

explore:  terraform_cloud_utm_funnel {
  label: "Terraform Cloud UTM Funnel"
}

explore: terraform_cloud_enterprise_saas_opportunity_overlap  {
  label: "Terraform Cloud / Enterprise Saas: Opportunity Overlap"
}

explore: terraform_cloud_users_enterprise_sfdc_accounts  {
  label: "Terraform Cloud Users (Enterprise SFDC Accounts)"
}

explore: create_account {
  label: "Terraform Cloud Create Account"
}

explore: create_oauth_client {
  label: "Terraform Cloud Create OAuth Client"
}

explore: create_organization {
  label: "Terraform Cloud Create Organization"
}

explore: create_registry_module {
  label: "Terraform Cloud Create Registry Module"
}

explore: create_run {
  label: "Terraform Cloud Create Run"
}

explore: create_team {
  label: "Terraform Cloud Create Team"
}

explore: create_workspace {
  label: "Terraform Cloud Create Workspace"
}

explore: identifies {
  label: "Terraform Cloud Identifies"
}

explore: login {
  label: "Terraform Cloud Login"
}

explore: pages {
  label: "Terraform Cloud Pages"
}

explore: remove_user_from_team {
  label: "Terraform Cloud Remove User From Team"
}

explore: show_workspace {
  label: "Terraform Cloud Show Workspace"
}

explore: state_version_created {
  label: "Terraform Cloud State Version Created"
}

explore: state_version_show {
  label: "Terraform Cloud State Version Show"
}

explore:  terraform_cloud_oganization_workspace_counts{
  label: "Terraform Cloud Organization Counts"
}

explore: terraform_cloud_state_version_viewed_counts {
  label: "Terraform Cloud State Version Viewed Counts"
}

explore: terraform_cloud_state_version_created_counts {
  label: "Terraform Cloud State Version Created Counts"
}

explore: terraform_cloud_update_subscription {
  label: "Terraform Cloud Update Subscription"
}

explore: terraform_cloud_active_users {
  label: "Terraform Cloud Active Users"
}

explore: terraform_cloud_active_practitioners {
  label: "Terraform Cloud Active Practitioners"
}
explore: terraform_cloud_active_practitioners_retention {
  label: "Terraform Cloud Retained Practitioners"
}
explore: terraform_cloud_active_orgs{
  label: "Terraform Cloud Active Organizations"
}

explore: terraform_cloud_active_orgs_retention {
  label: "Terraform Cloud Retained Organizations"
}
explore: terraform_cloud_stripe_charges {
  label: "Terrafrom Cloud Stripe Charges"
}
explore: terraform_cloud_salesforce_bookings {
  label: "Terrafrom Cloud Salesforce Bookings"
}
explore: terraform_cloud_aggregated_revenue {
  label: "Terrafrom Cloud Aggregated Revenue"
}
explore: terraform_cloud_salesforce_acv_waterfall {
  label: " Terraform Cloud Salesforce ACV Waterfall"
}
explore: terraform_cloud_stripe_acv_waterfall {
  label: " Terraform Cloud Stripe ACV Waterfall"
}
explore: terraform_cloud_learn_content_read {
  label: "Terraform Cloud Learn Content Read"
}
explore: terraform_cloud_referenced_learn_content {
  label: "Terraform Cloud Learn Content Referenced while using TFC"
}
explore: terraform_cloud_activations_in_local_timezone {
  label: "Terraform Cloud Activations localized to users timezone"
}
explore: terraform_cloud_user_org_events_with_plan {
  label: "Terraform Cloud Events (Users + Orgs with plan details)"
}
explore: terraform_cloud_org_events_with_plan_daily {
  label: "Terraform Cloud Events Daily Aggregated (Users + Orgs with plan details)"
}
explore: terraform_cloud_org_events_with_plan_retention_daily {
  label: "Terraform Cloud Events Daily Aggregated Retention (Users + Orgs with plan details)"
}
explore: terraform_cloud_rolling_retention_cohort_events_3mo_retained_status {
  label: "Terraform Cloud Rolling 3mo Retention Event Analysis"
}
explore: terraform_cloud_rolling_retention_feature_frequency_analysis {
  label: "Terraform Cloud Rolling 3mo Retention Event Frequency (first month) Analysis"
}
explore: zendesk_ticket_detail {
  label: "Zendesk Ticket Detail"
}
explore: zendesk_word_frequency {
  label: "Zendesk Ticket Word Frequency"
}

explore: tracks {
  label: "Terraform Cloud Tracks"
}

explore: eam1_conversions {
  label: "EAM 1 Conversions"
}
explore: eam2_conversions {
  label: "EAM 2 Conversions"
}
explore: na_waterfall_conversions {
  label: "NA Conversions"
}
explore: emea_waterfall_conversions {
  label: "EMEA Conversions"
}
explore: apac_waterfall_conversions {
  label: "APAC Conversions"
}
explore: cam_waterfall_conversions {
  label: "CAM Conversions"
}
explore: waterfall_conversions {
  label: "Waterfall Conversions"
}

explore: fastly_metrics {
  label: "OSS Downloads (v2)"
  join: companies_with_ip_addresses{
    type: left_outer
    sql_on: ${companies_with_ip_addresses.ip_address} = ${fastly_metrics.remote_ip} ;;
    relationship: many_to_one
  }
}


# These need to be organized and replace the Releases setup
explore: licenses_saved {
  label:  "Licenses Saved"
}
explore: dockerhub_downloads {
  label: "DockerHub Downloads"
}

explore: s3_binary_sfdc {
  label: "Unlocked S3 Enterprise Binary Downloads"
}

explore: meta_redshift_monthly_bill_text {
  label: "Meta Redshift Monthly Bill"
}

explore: top_10_schemas_by_data_retention {
  label: "Meta Redshift Schemas by Data"
}

# These need to be migrated into HCP project
explore: hcs_users_marketo {
  label: "HCS Users Marketo"
}

explore: hcp_users_accounts_sfdc {
  label: "HCP Users Salesforce Accounts"
}
