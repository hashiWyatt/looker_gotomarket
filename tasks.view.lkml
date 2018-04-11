view: tasks {
  sql_table_name: salesforce.tasks ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.activity_date ;;
  }

  dimension: call_duration_in_seconds {
    type: number
    sql: ${TABLE}.call_duration_in_seconds ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_archived {
    type: yesno
    sql: ${TABLE}.is_archived ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_high_priority {
    type: yesno
    sql: ${TABLE}.is_high_priority ;;
  }

  dimension: is_recurrence {
    type: yesno
    sql: ${TABLE}.is_recurrence ;;
  }

  dimension: is_reminder_set {
    type: yesno
    sql: ${TABLE}.is_reminder_set ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension_group: reminder_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.reminder_date_time ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: task_subtype {
    type: string
    sql: ${TABLE}.task_subtype ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: what_count {
    type: number
    sql: ${TABLE}.what_count ;;
  }

  dimension: what_id {
    type: string
    sql: ${TABLE}.what_id ;;
  }

  dimension: who_count {
    type: number
    sql: ${TABLE}.who_count ;;
  }

  dimension: who_id {
    type: string
    sql: ${TABLE}.who_id ;;
  }

  dimension: zoom_app_is_external_c {
    type: yesno
    sql: ${TABLE}.zoom_app_is_external_c ;;
  }

  dimension: zoom_app_is_zoom_meeting_c {
    type: yesno
    sql: ${TABLE}.zoom_app_is_zoom_meeting_c ;;
  }

  dimension: zoom_app_join_before_host_c {
    type: yesno
    sql: ${TABLE}.zoom_app_join_before_host_c ;;
  }

  dimension: zoom_app_make_it_zoom_meeting_c {
    type: yesno
    sql: ${TABLE}.zoom_app_make_it_zoom_meeting_c ;;
  }

  dimension: zoom_app_send_email_c {
    type: yesno
    sql: ${TABLE}.zoom_app_send_email_c ;;
  }

  dimension: zoom_app_use_personal_zoom_meeting_id_c {
    type: yesno
    sql: ${TABLE}.zoom_app_use_personal_zoom_meeting_id_c ;;
  }

  dimension: zoom_app_zoom_meeting_status_c {
    type: string
    sql: ${TABLE}.zoom_app_zoom_meeting_status_c ;;
  }

  dimension: zoom_app_zoom_meeting_status_fr_c {
    type: string
    sql: ${TABLE}.zoom_app_zoom_meeting_status_fr_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, accounts.name, accounts.id]
  }
}
