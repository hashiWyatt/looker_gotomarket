connection: "cdp"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: saturday
fiscal_month_offset: 1

explore: digital_io_sites_users {
  label: ".io Site Users"
}

explore: digital_learn_site_users {
  label: "Learn Site Users"
}
