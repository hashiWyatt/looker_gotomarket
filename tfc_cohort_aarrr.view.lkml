view: tfc_cohort_aarrr {
  derived_table: {
    sql: with
      -- spine of months to join on
      cal0 as (
        select
          date_trunc('month',(dateadd(day, -row_number() over (order by true), sysdate::date))) as cal_month
        from terraform_cloud.create_account -- no data from this table gets used
        limit 1000
      ),
      cal as (
          select cal_month
          from cal0
          where cal_month >= '2020-02-01'
          group by cal_month
      ),
      -- TFC users grouped by sign up month
      tfc_internal_users AS (
          select distinct user_id from terraform_cloud.user_id_by_email where email like '%@hashicorp.com'
      ),
      tfc_users_signups AS (
          select original_timestamp as created_at, user_id
          from terraform_cloud.create_account
          where user_id not in (select user_id from tfc_internal_users)
      ),
      tfc_user_signups_by_month as (
        select
          date_trunc('month', created_at) as created_month
        , count(*) as tfc_total_sign_ups
        from tfc_users_signups
        group by created_month
      ),
      -- TFC MAU
      tfc_users_active_last_30 as (
          select
            user_id
          , true as active
          from terraform_cloud.tracks
          where original_timestamp  >= DATEADD(Day,-30,GETDATE())
      ),
      tfc_active_user_cohorts as (
        select
          date_trunc('month', tfc_users_signups.created_at) as created_month
        , count(distinct tfc_users_active_last_30.user_id) as mau_tracks
        from tfc_users_signups
        left join tfc_users_active_last_30
          on tfc_users_signups.user_id = tfc_users_active_last_30.user_id
        group by created_month
      ),
      -- TFC Orgs grouped by created month
      tfc_internal_organizations AS (
        select distinct organization_id
        from terraform_cloud.create_organization
        where user_id in (select user_id from tfc_internal_users) and organization_id is not null
      ),
      tfc_orgs as (
        select
          date_trunc ('month', timestamp) as created_month
          , count (distinct organization_id) as tfc_total_orgs_created
        from terraform_cloud.create_organization c
        where organization_id is not null
        and organization_id not in (select organization_id from tfc_internal_organizations)
        group by created_month
      ),
      -- Count of TFC Orgs that Created a Run in the Last 30 Days
      -- COunt of Runs Created in the Last 30 Days
      has_run_last_30 as (
        select
          date_trunc('month', t.timestamp) as cohort_month
            , count(distinct r.organization_id) as mao_run_last_30
            , count(distinct r._id) as mac_cnt_runs_last_30 -- _id is unique identifier of the run
        from terraform_cloud.create_organization t
        left join terraform_cloud.create_run r on t.organization_id = r.organization_id
        where
          r.timestamp >= DATEADD(Day,-30,GETDATE())
          and t.organization_id is not null
          and t.organization_id not in (select organization_id from tfc_internal_organizations)
          and r._id is not null
        group by cohort_month
      ),
      -- Orgs currently on paid plans
      tfc_paying_orgs as (
        select date_trunc ('month',c.timestamp) as cohort_month
            , count (distinct a.organizations_external_id) as paying_orgs
        from terraform_cloud.create_organization c
        left join cloud_product_bi_data_mart_imports.tfcb_atlas_organization_subscriptions a on c.organization_id = a.organizations_external_id
        where a.feature_set_name in ('Business','Governance and Policy','Team','Team & Governance')
        and c.organization_id is not null
        group by 1
        order by 1 desc
      )
      -- final query
      select
      c.cal_month as cohort_month
          , u.tfc_total_sign_ups as total_users_created
          , mau.mau_tracks
          , o.tfc_total_orgs_created as total_orgs_created
          , mao_run_last_30
          , mac_cnt_runs_last_30
          , paying_orgs
      from cal c
      left join tfc_user_signups_by_month u on u.created_month = c.cal_month
      left join tfc_active_user_cohorts mau on mau.created_month = c.cal_month
      left join tfc_orgs o on o.created_month = c.cal_month
      left join has_run_last_30 r on r.cohort_month = c.cal_month
      left join tfc_paying_orgs p on p.cohort_month = c.cal_month
      order by c.cal_month desc
      ;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: cohort_month {
    type: time
    sql: ${TABLE}.cohort_month ;;
  }

  dimension: total_users_created {
    type: number
    sql: ${TABLE}.total_users_created ;;
  }

  dimension: mau_tracks {
    type: number
    sql: ${TABLE}.mau_tracks ;;
  }

  dimension: total_orgs_created {
    type: number
    sql: ${TABLE}.total_orgs_created ;;
  }

  dimension: mao_run_last_30 {
    type: number
    sql: ${TABLE}.mao_run_last_30 ;;
  }

  dimension: mac_cnt_runs_last_30 {
    type: number
    sql: ${TABLE}.mac_cnt_runs_last_30 ;;
  }

  dimension: paying_orgs {
    type: number
    sql: ${TABLE}.paying_orgs ;;
  }

  set: detail {
    fields: [
      cohort_month_time,
      total_users_created,
      mau_tracks,
      total_orgs_created,
      mao_run_last_30,
      mac_cnt_runs_last_30,
      paying_orgs
    ]
  }
}
