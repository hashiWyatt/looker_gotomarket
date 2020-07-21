view: terraform_cloud_referenced_learn_content {
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
          and original_timestamp > getdate()-'30 days'::interval
      )

      select tfc_action.event_text, label, page_url, count(*) from terraform_cloud.tracks as tfc_action, ${terraform_cloud_learn_content_read.SQL_TABLE_NAME} as tfc_learn_content
      where
        tfc_action.sent_at > getdate()-'30 days'::interval and
        tfc_learn_content > getdate()-'30 days'::interval and
        tfc_action.user_id = tfc_learn_content.user_id and (
          ((tfc_action.sent_at - '5 minutes'::interval) < tfc_learn_content.event_at and (tfc_action.sent_at + '5 minutes'::interval) > tfc_learn_content.event_at) --OR
          -- (tfc_learn_content.event_at - '5 minutes'::interval) < tfc_action.sent_at and (tfc_learn_content.event_at + '5 minutes'::interval) > tfc_action.sent_at
        )
        group by 1, 2, 3
 ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [event_text, label, page_url, count]
  }
}
