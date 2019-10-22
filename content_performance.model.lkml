connection: "cdp"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

week_start_day: friday

explore:  content_blog_pages {
  label: "Blog Pages"
}

explore:  content_resource_pages {
  label: "Resource Pages"
}

explore:  content_consul_demo_resource_funnel {
  label: "Demo Resource Funnel"
}
