view: tfc_user_web_engagement {
  derived_table: {
    sql: with user_web_activity as (
        select
          user_id,
          count(*) as views
        from terraform_cloud.pages
        where timestamp > getdate() - '90 days'::interval
        and user_id is not null
        group by user_id
      )

      select
        w.user_id,
        u.email,
        views as views,
        percent_rank() over (order by views) as percent_rank
      from user_web_activity w
      left join terraform_cloud.users u
      on w.user_id = u.id
      where email not like '%@hashicorp.com'
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: percent_rank {
    type: number
    sql: ${TABLE}.percent_rank ;;
  }

  set: detail {
    fields: [user_id, email, views, percent_rank]
  }
}
