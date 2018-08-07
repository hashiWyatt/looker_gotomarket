connection: "cdp"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

fiscal_month_offset: -11

# explore: _group {}

explore: accounts {
  join: opportunities{
    type: left_outer
    sql_on: ${accounts.id} = ${opportunities.account_id} ;;
    relationship: one_to_many
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

# explore: contacts {
#   join: accounts {
#     type: left_outer
#     sql_on: ${contacts.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
# }
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
  join: users {
    type: left_outer
    sql_on: ${users.id} = ${opportunities.owner_id} ;;
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
