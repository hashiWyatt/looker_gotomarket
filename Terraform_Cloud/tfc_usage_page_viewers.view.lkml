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
      )

      select * from user_visits
       ;;
  }

  measure: visits {
    type: sum
    drill_fields: [visits]
  }

  measure: visitors {
    type: count_distinct
    drill_fields: [user_id]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: email  {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: email_domain  {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }


  set: detail {
    fields: [organization]
  }
}
