connection: "cdp"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: sunday

# ===== 2020 =====

explore:  hashiconf_pages {
  label: "2020 Pages"
}

explore:  hashiconf_eu_ticket_funnel {
  label: "2020 EU Ticket Funnel"
}

explore:  hashiconf_us_ticket_funnel {
  label: "2020 US Ticket Funnel"
}

# ==== 2021 =====

explore: hashiconf_pages_2021 {
  label: "2021 Pages"
}

explore: hashiconf_europe_2021_registration_funnel {
  label: "2021 EU Registration Funnel"
}

explore: hashiconf_europe_2021_workshops_funnel {
  label: "2021 EU Workshops Funnel"
}

explore: hashiconf_global_2021_registration_funnel {
  label: "2021 Global Registration Funnel"
}

explore: hashiconf_global_2021_workshops_funnel {
  label: "2021 Global Workshops Funnel"
}

# ===== Digital Platform =====

explore: hashiconf_digital_platform_core_user_funnel {
  label: "Digital Platform User Funnel"
}

explore: hashiconf_digital_platform_pages {
  label: "Digital Platform Pageviews"
}

explore: hashiconf_digital_platform_livestream_views {
  label: "Digital Platform Livestream Views"
}
