view: product_learn_unique_visitors {
  derived_table: {
    sql: SELECT * FROM
(SELECT
date_trunc('month', timestamp) AS visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Terraform' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/terraform/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Vault' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/vault/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Consul' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/consul/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Nomad' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/nomad/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Packer' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/packer/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'Vagrant' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/vagrant/%'
GROUP BY visitor_month)
UNION
(SELECT
date_trunc('month', timestamp) as visitor_month,
count(distinct(anonymous_id)) AS unique_visitors,
'All Products' as product
FROM hashicorp_learn.pages
WHERE url like '%learn.hashicorp.com/%'
GROUP BY visitor_month)
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
