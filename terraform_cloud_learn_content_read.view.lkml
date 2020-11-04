view: terraform_cloud_learn_content_read {
  derived_table: {
    sql: with tfc_users as (
        select
          coalesce(create_account.user_id, users.id) as user_id,
          to_char(date_trunc('week', sent_at), 'YYYY-MM-DD') as user_cohort,
          email,
          email_domain
        from terraform_cloud.create_account
        full outer join terraform_cloud.users
        on create_account.user_id = users.id
      ),
      learn_users as (
        select distinct
          user_id as learn_user_id,
          emails,
          url,
          organizations_url,
          company,
          nickname,
          following,
          picture,
          email,
          email_verified,
          following_url,
          followers_url,
          events_url,
          identities
        from auth0.success_login
      ),
      learn_user_terraform_content as (
        select
          explicit_login.user_id as learn_user_id,
          content_read.*
        from
          hashicorp_learn.explicit_login, hashicorp_learn.content_read
        where product = 'terraform'
        and content_read.anonymous_id = explicit_login.anonymous_id
      ),
      tfc_learn_users as (
        select
          learn_users.*,
          tfc_users.user_id,
          tfc_users.user_cohort,
          email_domain
        from tfc_users, learn_users
        where tfc_users.email = learn_users.email
      ),
      tfc_learn_content as (
        select
          tfc_learn_users.user_id,
          user_cohort,
          tfc_learn_users.learn_user_id,
          emails,
          url,
          organizations_url,
          company,
          nickname,
          following,
          picture,
          email,
          email_verified,
          following_url,
          followers_url,
          events_url,
          identities
          event,
          original_timestamp as event_at,
          context_page_path as page_path,
          context_page_referrer as page_referrer,
          context_page_title as page_title,
          context_page_url as page_url,
          category,
          product,
          topic,
          event_text,
          label
        from tfc_learn_users, learn_user_terraform_content
        where
          tfc_learn_users.learn_user_id = learn_user_terraform_content.learn_user_id
          and email not like '%@hashicorp.com'
      )

      select * from tfc_learn_content
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;:
  }
  dimension: tfc_user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: learn_user_id {
    type: string
    sql: ${TABLE}.learn_user_id ;;
  }

  dimension: emails {
    type: string
    sql: ${TABLE}.emails ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: organizations_url {
    type: string
    sql: ${TABLE}.organizations_url ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: following {
    type: number
    sql: ${TABLE}.following ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.picture ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_verified {
    type: string
    sql: ${TABLE}.email_verified ;;
  }

  dimension: following_url {
    type: string
    sql: ${TABLE}.following_url ;;
  }

  dimension: followers_url {
    type: string
    sql: ${TABLE}.followers_url ;;
  }

  dimension: events_url {
    type: string
    sql: ${TABLE}.events_url ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension_group: event_at {
    type: time
    sql: ${TABLE}.event_at ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }

  dimension: page_referrer {
    type: string
    sql: ${TABLE}.page_referrer ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: topic {
    type: string
    sql: ${TABLE}.topic ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  set: detail {
    fields: [
      learn_user_id,
      emails,
      url,
      organizations_url,
      company,
      nickname,
      following,
      picture,
      email,
      email_verified,
      following_url,
      followers_url,
      events_url,
      event,
      event_at_time,
      page_path,
      page_referrer,
      page_title,
      page_url,
      category,
      product,
      topic,
      event_text,
      label
    ]
  }
}
