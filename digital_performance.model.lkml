connection: "cdp"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: saturday
fiscal_month_offset: 1

explore: hashiconf_digital_platform_core_user_funnel {
  label: "Hashiconf Digital Platform Core User Funnel"
}

explore: hashiconf_digital_platform_pages {
  label: "Hashiconf Digital Platform Pages"
}

explore: digital_io_sites_users {
  label: ".io Site Users"
}

explore: digital_io_sites_pageviews {
  label: ".io Site Pageviews"
}

explore: digital_journey {
  label: "Digital Journey"
}

explore: digital_learn_site_users {
  label: "Learn Site Users"
}

explore: enriched_learn_pages {
  label: "Learn Pages (enriched)"
}

explore:  g2k_first_oss_downloads {
  label: "G2K First OSS Downloads"
}

explore: g2k_first_oss_downloads_by_product {
  label: "G2K First OSS Downloads (by Product)"
}