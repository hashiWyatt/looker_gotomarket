connection: "cdp"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: sunday

explore:  hashidays_ticket_funnel {
  label: "Ticket Funnel"
}
explore:  hashidays_pages {
  label: "Pages"
}
