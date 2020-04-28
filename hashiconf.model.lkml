connection: "cdp"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: sunday

explore:  hashiconf_pages {
  label: "Pages"
}

explore:  hashiconf_eu_ticket_funnel {
  label: "EU Ticket Funnel"
}

explore:  hashiconf_us_ticket_funnel {
  label: "US Ticket Funnel"
}
