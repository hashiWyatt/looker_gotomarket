view: sql_runner_query_test {
  derived_table: {
    sql: Select
      count(main1.who_id) as count_leads,
      count(main1.who_id)*100 /sum(count(*)) over ()  as Percent_leads,
      main1.avg_days
      from
      (Select
      temp.who_id,
      avg (temp.tasks_created_date - temp.leads_created_date) as Avg_days,
      temp.Rep_name
      from
      (SELECT
        tasks.who_id as who_id,
       first_value (DATE(leads.created_date)) over(partition by tasks.who_id order by leads.created_date asc rows between unbounded preceding and unbounded following  ) leads_created_date,
        first_value (DATE(tasks.created_date)) over(partition by tasks.who_id order by tasks.created_date asc rows between unbounded preceding and unbounded following  ) tasks_created_date,
        users.first_name as "Rep_name"
      FROM salesforce.leads  AS leads
      LEFT JOIN salesforce.tasks  AS tasks ON leads.id = tasks.who_id
      LEFT JOIN salesforce.users  AS users ON users.id = leads.owner_id
      LEFT JOIN salesforce.role  AS role ON role.id = users.user_role_id

      WHERE ((((leads.created_date ) >= ((DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ))) AND (leads.created_date ) < ((DATEADD(day,90, DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ) )))))) AND (tasks.subject LIKE '%Message Sent:%') AND (role.name LIKE '%Inside Sales%')

      ) temp
      group by 1,3) as main1
      group by main1.avg_days
      order by main1.avg_days
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: count_leads {
    type: number
    sql: ${TABLE}.count_leads ;;
  }

  dimension: percent_leads {
    type: number
    sql: ${TABLE}.percent_leads ;;
  }

  dimension: avg_days {
    type: number
    sql: ${TABLE}.avg_days ;;
  }

  set: detail {
    fields: [count_leads, percent_leads, avg_days]
  }
}
