view: sla_first_touch_1 {
  derived_table: {
    sql: WITH sla_first_response AS (Select
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

      WHERE ((((leads.created_date ) >= ((DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ))) AND (leads.created_date ) < ((DATEADD(day,90, DATEADD(day,-89, DATE_TRUNC('day',GETDATE()) ) )))))) AND (tasks.subject LIKE 'Reply%') AND (role.name LIKE '%Inside Sales%')

      ) temp
      group by 1,3) as main1
      group by main1.avg_days
      order by main1.avg_days
 )
SELECT
  sla_first_response.percent_leads  AS "sla_first_response.percent_leads",
  sla_first_response.avg_days  AS "sla_first_response.avg_days"
FROM sla_first_response

GROUP BY 1,2
ORDER BY 1
LIMIT 500
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sla_first_response_percent_leads {
    type: number
    sql: ${TABLE}."sla_first_response.percent_leads" ;;
  }

  dimension: sla_first_response_avg_days {
    type: number
    sql: ${TABLE}."sla_first_response.avg_days" ;;
  }

  set: detail {
    fields: [sla_first_response_percent_leads, sla_first_response_avg_days]
  }
}
