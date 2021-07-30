view: tfc_usage_page_viewers {
  derived_table: {
    sql: with pages as (
        select user_id, url, regexp_substr(url, '/app/(.+)/usage', -1, 1, 'e') as organization from terraform_cloud.pages where received_at > getdate()-'60 days'::interval and url like '%/usage'
      ),
      viewers as (
        select user_id, organization, count(*) from pages group by user_id, organization
      ),
      user_emails as (
        select id as user_id, email, email_domain from terraform_cloud.users
      ),
      user_visits as (
        select v.user_id, v.count as visits, organization, email, email_domain
        from viewers v
        left join user_emails u
        on v.user_id = u.user_id
        where email_domain <> 'hashicorp.com'
      ), domain_visitors as (
        select email_domain, count(*) as visitors from user_visits
        group by email_domain
      ),
      org_visitors as (
        select organization, count(*) as visitors from user_visits
        group by organization
      )

      select * from user_visits
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: visitors {
    type: number
    sql: ${TABLE}.visitors ;;
  }

  set: detail {
    fields: [organization, visitors]
  }
}
