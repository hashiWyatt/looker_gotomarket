view: first_touch_v1 {
  derived_table: {
    sql: Select
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
      --GROUP BY 1
      --ORDER BY 2
      ) temp
      group by 1,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: who_id {
    type: string
    sql: ${TABLE}.who_id ;;
  }

  dimension: avg_days {
    type: number
    sql: ${TABLE}.avg_days ;;
  }

  dimension: rep_name {
    type: string
    sql: ${TABLE}.rep_name ;;
  }

  set: detail {
    fields: [who_id, avg_days, rep_name]
  }
}
