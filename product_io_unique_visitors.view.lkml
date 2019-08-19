view: product_io_unique_visitors {
  derived_table: {
    sql: SELECT
*
FROM
((SELECT
date_trunc('month', timestamp) AS visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Consul' AS product
FROM consul_oss_site.pages
WHERE visitor_month >= '2019-02-01'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) AS visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Vault' AS product
FROM vault_oss_site.pages
WHERE visitor_month >= '2019-02-01'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) AS visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Terraform' AS product
FROM terraform_oss_site.pages
WHERE visitor_month >= '2019-02-01'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) AS visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Nomad' AS product
FROM nomad_oss_site.pages
WHERE visitor_month >= '2019-02-01'
GROUP BY visitor_month))
WHERE visitor_month != '2029-02-01'
             ;;
  }


  dimension_group: visitor_month {
    type: time
    sql: ${TABLE}.visitor_month ;;
  }

  measure: unique_visitors {
    type: max
    sql: ${TABLE}.unique_visitors ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

}
