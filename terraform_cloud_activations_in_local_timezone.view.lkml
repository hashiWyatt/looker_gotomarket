view: terraform_cloud_activations_in_local_timezone {
  derived_table: {
    sql: -- select * from terraform_cloud.identifies where sent_at > getdate()-'2 days'::interval and context_ip is not null limit 10

      with signups as (
        select
          user_id, min(sent_at) as signed_up_at from terraform_cloud.create_account where sent_at > getdate()-'30 days'::interval group by user_id
      ),
      first_states as (
        select user_id, min(sent_at) as first_state_at from terraform_cloud.state_version_created where sent_at > getdate()-'30 days'::interval group by user_id
      ),
      local_user_timezones as (
        select
          distinct
            user_id,
            context_locale,
            case when context_locale = 'en-US' then '-5 hours'::interval
            when context_locale = 'ja' then '+9 hours'::interval
            when context_locale = 'ja-JP' then '+9 hours'::interval
            when context_locale = 'en-GB' then '+1 hours'::interval
            when context_locale = 'en-gb' then '+1 hours'::interval
            when context_locale = 'de-DE' then '+1 hours'::interval
            when context_locale = 'de-de' then '+1 hours'::interval
            when context_locale = 'en-CA' then '-4 hours'::interval
            when context_locale = 'en-AU' then '-4 hours'::interval
            when context_locale = 'pt-BR' then '-3 hours'::interval
            end as utc_offset
          from terraform_cloud.identifies where context_locale is not null and sent_at > getdate()-'60 days'::interval and context_locale in ('en-GB', 'en-gb', 'en-US', 'ja', 'ja-JP', 'en-CA', 'en-AU', 'pt-BR', 'de-DE', 'de-de')
      ),
      localize_signups_states as (
        select
          signups.user_id,
          context_locale,
          signed_up_at + utc_offset as local_signed_up_at,
          first_state_at + utc_offset as local_first_state_at,
          date_part(h, signed_up_at + utc_offset) as signup_hour,
          case
            when first_state_at is not null then
              (extract(epoch from (first_state_at - signed_up_at))/3600)::int
          end as hours_to_state
        from signups
        inner join local_user_timezones
        on signups.user_id = local_user_timezones.user_id
        left join first_states
        on signups.user_id = first_states.user_id
      )

      select user_id, context_locale, signup_hour, hours_to_state from localize_signups_states
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: context_locale {
    type: string
    sql: ${TABLE}.context_locale ;;
  }

  dimension: signup_hour {
    type: number
    sql: ${TABLE}.signup_hour ;;
  }

  dimension: hours_to_state {
    type: number
    sql: ${TABLE}.hours_to_state ;;
  }

  set: detail {
    fields: [user_id, context_locale, signup_hour, hours_to_state]
  }
}
