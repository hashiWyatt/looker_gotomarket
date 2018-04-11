view: events {
  sql_table_name: salesforce.events ;;

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

  dimension_group: activity_date {
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
    sql: ${TABLE}.activity_date_time ;;
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

  dimension: duration_in_minutes {
    type: number
    sql: ${TABLE}.duration_in_minutes ;;
  }

  dimension_group: end_date {
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
    sql: ${TABLE}.end_date_time ;;
  }

  dimension: event_subtype {
    type: string
    sql: ${TABLE}.event_subtype ;;
  }

  dimension: group_event_type {
    type: string
    sql: ${TABLE}.group_event_type ;;
  }

  dimension: is_all_day_event {
    type: yesno
    sql: ${TABLE}.is_all_day_event ;;
  }

  dimension: is_archived {
    type: yesno
    sql: ${TABLE}.is_archived ;;
  }

  dimension: is_child {
    type: yesno
    sql: ${TABLE}.is_child ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_group_event {
    type: yesno
    sql: ${TABLE}.is_group_event ;;
  }

  dimension: is_private {
    type: yesno
    sql: ${TABLE}.is_private ;;
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

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
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

  dimension: recurrence_activity_id {
    type: string
    sql: ${TABLE}.recurrence_activity_id ;;
  }

  dimension: recurrence_day_of_week_mask {
    type: number
    sql: ${TABLE}.recurrence_day_of_week_mask ;;
  }

  dimension_group: recurrence_end_date_only {
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
    sql: ${TABLE}.recurrence_end_date_only ;;
  }

  dimension: recurrence_interval {
    type: number
    sql: ${TABLE}.recurrence_interval ;;
  }

  dimension_group: recurrence_start_date {
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
    sql: ${TABLE}.recurrence_start_date_time ;;
  }

  dimension: recurrence_time_zone_sid_key {
    type: string
    sql: ${TABLE}.recurrence_time_zone_sid_key ;;
  }

  dimension: recurrence_type {
    type: string
    sql: ${TABLE}.recurrence_type ;;
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

  dimension: show_as {
    type: string
    sql: ${TABLE}.show_as ;;
  }

  dimension_group: start_date {
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
    sql: ${TABLE}.start_date_time ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: zoom_app_zoom_meeting_creation_status_c {
    type: string
    sql: ${TABLE}.zoom_app_zoom_meeting_creation_status_c ;;
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
