connection: "cdp"

include: "/Terraform_Cloud/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: tfc_usage_page_viewers {
  group_label: "Terraform Cloud"
  label: "Usage Page Viewers"
}

explore: tfc_user_web_engagement {
  group_label: "Terraform Cloud"
  label: "Web Engagement"
}

explore: tfc_user_cli_engagement {
  group_label: "Terraform Cloud"
  label: "CLI Engagement"
}
