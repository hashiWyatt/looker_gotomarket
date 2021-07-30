view: tfc_user_cli_engagement {
  derived_table: {
    sql: with user_cli_activity as (
        select
          user_id,
          organization,
          cli_version,
          count(*) as runs
        from
          terraform_cloud.create_run
        where
          client='cli'
          and timestamp > getdate() - '90 days'::interval
        group by
          user_id,
          organization,
          cli_version
      )

      select
        c.user_id,
        u.email,
        organization,
        cli_version,
        runs,
        percent_rank() over (order by runs) as percent_rank
      from user_cli_activity c
      left join terraform_cloud.users u
      on c.user_id = u.id
      where email not like '%@hashicorp.com'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum {
    type:  sum
    drill_fields: [detail*]
    sql: ${TABLE}.runs ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: runs {
    type: string
    sql: ${TABLE}.runs ;;
  }

  dimension: percent_rank {
    type: number
    sql: ${TABLE}.percent_rank ;;
  }

  set: detail {
    fields: [user_id, email, organization]
  }
}
