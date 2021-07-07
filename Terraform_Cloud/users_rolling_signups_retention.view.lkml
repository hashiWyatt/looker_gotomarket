view: tfc_users_rolling_signups_retention {
  derived_table: {
    sql: with signups as (
  select created_at, user_id from ${tfc_users_signups.SQL_TABLE_NAME}
),
activity as (
  select distinct date_trunc('day', event_at) as event_at, user_id from ${tfc_users_activity.SQL_TABLE_NAME} where new_signup = false
),
daily_signups as (
  select
    date_trunc('day', created_at) as created_at,
    count(*) as users
  from signups
  group by date_trunc('day', created_at)
),
monthly_signups as (
  select
    a.created_at,
    sum(b.users) as users
  from daily_signups a, daily_signups b
  where
    a.created_at >= b.created_at
    and b.created_at > (a.created_at - '30 days'::interval)
  group by a.created_at
),
rolling as (
  select
    d.created_at,
    d.users as users_signups_1day,
    m.users as users_signups_30day,
    count(distinct user_id) as users_active_30day
  from daily_signups d
  inner join monthly_signups m
  on d.created_at = m.created_at
  left join activity ra
  on ra.event_at <= d.created_at and ra.event_at > (d.created_at - '30 days'::interval)
  group by 1, 2, 3

)

select
  created_at,
  users_signups_30day,
  users_active_30day,
  -- previously active users + new signups in the past 30 days (because we don't count new accounts in 'active') - active users in this period = remainder is people that have become inactive
  LEAST(0,
    (lag(users_active_30day, 30) over (order by created_at) + lag(users_signups_30day, 30) over (order by created_at) - users_active_30day) * -1
    ) as users_churned_30day
from rolling
order by created_at


       ;;
  }

  measure: users_active_30day {
    type: average
    sql: ${TABLE}.users_active_30day ;;
  }
  measure: users_churned_30day {
    type: average
    sql: ${TABLE}.users_churned_30day ;;
  }
  measure: users_signups_30day {
    type: average
    sql: ${TABLE}.users_signups_30day ;;
  }
  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  set: detail {
    fields: [created_at_time]
  }
}
