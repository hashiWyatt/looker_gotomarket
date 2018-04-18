view: initial_query_first_touch_hours {
  derived_table: {
    sql: select
       a.who_id as who_id,
       a.Rep_name as Rep_name,
      tasks_first_created_date,
      tasks_first_created_datetime,
      EXTRACT(hour FROM tasks_first_created_datetime_dt) as task_hours,
      leads_first_created_datetime,
      leads_first_created_datetime_dt,
      EXTRACT(hour from leads_first_created_datetime_dt) as lead_hours,
      EXTRACT(hour FROM tasks_first_created_datetime_dt)-
      EXTRACT(hour from leads_first_created_datetime_dt) as hours_diff


      from
        (

      SELECT
        tasks.who_id as who_id,
          users.first_name as "Rep_name",
        first_value (DATE(leads.created_date)) over(partition by tasks.who_id order by leads.created_date asc rows between unbounded preceding and unbounded following  ) leads_first_created_date,
        first_value (DATE(tasks.created_date)) over(partition by tasks.who_id order by tasks.created_date asc rows between unbounded preceding and unbounded following  ) tasks_first_created_date,
        first_value (TO_CHAR(leads.created_date , 'YYYY-MM-DD HH24:MI:SS'))
              over(partition by tasks.who_id order by 1 asc rows between unbounded preceding and unbounded following  ) leads_first_created_datetime,
        first_value (TO_CHAR(tasks.created_date , 'YYYY-MM-DD HH24:MI:SS'))
              over(partition by tasks.who_id order by 1 asc rows between unbounded preceding and unbounded following  ) tasks_first_created_datetime,
        first_value (TO_TIMESTAMP(tasks.created_date , 'YYYY-MM-DD HH24:MI:SS'))
              over(partition by tasks.who_id order by 1 asc rows between unbounded preceding and unbounded following  ) tasks_first_created_datetime_dt,
         first_value (TO_TIMESTAMP(leads.created_date , 'YYYY-MM-DD HH24:MI:SS'))
              over(partition by tasks.who_id order by 1 asc rows between unbounded preceding and unbounded following  ) leads_first_created_datetime_dt


      FROM salesforce.leads  AS leads
      LEFT JOIN salesforce.tasks  AS tasks ON leads.id = tasks.who_id
      LEFT JOIN salesforce.users  AS users ON users.id = leads.owner_id
      LEFT JOIN salesforce.role  AS role ON role.id = users.user_role_id
      LIMIT 50
      )a
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

  dimension: rep_name {
    type: string
    sql: ${TABLE}.rep_name ;;
  }

  dimension: tasks_first_created_date {
    type: date
    sql: ${TABLE}.tasks_first_created_date ;;
  }

  dimension: tasks_first_created_datetime {
    type: string
    sql: ${TABLE}.tasks_first_created_datetime ;;
  }

  dimension: task_hours {
    type: number
    sql: ${TABLE}.task_hours ;;
  }

  dimension: leads_first_created_datetime {
    type: string
    sql: ${TABLE}.leads_first_created_datetime ;;
  }

  dimension_group: leads_first_created_datetime_dt {
    type: time
    sql: ${TABLE}.leads_first_created_datetime_dt ;;
  }

  dimension: lead_hours {
    type: number
    sql: ${TABLE}.lead_hours ;;
  }

  dimension: hours_diff {
    type: number
    sql: ${TABLE}.hours_diff ;;
  }

  set: detail {
    fields: [
      who_id,
      rep_name,
      tasks_first_created_date,
      tasks_first_created_datetime,
      task_hours,
      leads_first_created_datetime,
      leads_first_created_datetime_dt_time,
      lead_hours,
      hours_diff
    ]
  }
}
