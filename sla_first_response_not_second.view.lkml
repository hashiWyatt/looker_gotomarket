view: sla_first_response_not_second {
  derived_table: {
    sql: SELECT
        tasks.who_id as who_id,
       first_value (DATE(leads.created_date)) over(partition by tasks.who_id order by leads.created_date asc rows between unbounded preceding and unbounded following  ) leads_created_date,
        first_value (DATE(tasks.created_date)) over(partition by tasks.who_id order by tasks.created_date asc rows between unbounded preceding and unbounded following  ) tasks_created_date,
        users.first_name as "Rep_name"
      FROM salesforce.leads  AS leads
      LEFT JOIN salesforce.tasks  AS tasks ON leads.id = tasks.who_id
      LEFT JOIN salesforce.users  AS users ON users.id = leads.owner_id
      LEFT JOIN salesforce.role  AS role ON role.id = users.user_role_id

      WHERE ((((leads.created_date ) >= ((DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ))) AND (leads.created_date ) < ((DATEADD(day,90, DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ) ))))))
      AND (tasks.subject LIKE 'Reply%')
      AND (tasks.subject not LIKE 'Reply: RE%')
      AND (role.name LIKE '%Inside Sales%')
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

  dimension: leads_created_date {
    type: date
    sql: ${TABLE}.leads_created_date ;;
  }

  dimension: tasks_created_date {
    type: date
    sql: ${TABLE}.tasks_created_date ;;
  }

  dimension: rep_name {
    type: string
    sql: ${TABLE}.rep_name ;;
  }

  set: detail {
    fields: [who_id, leads_created_date, tasks_created_date, rep_name]
  }
}
