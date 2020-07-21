view: terraform_cloud_referenced_learn_content {
  derived_table: {
    sql:
      select tfc_action.event_text, label, page_url from terraform_cloud.tracks as tfc_action, ${terraform_cloud_learn_content_read.SQL_TABLE_NAME} as tfc_learn_content
      where
        tfc_action.sent_at > getdate()-'30 days'::interval and
        tfc_learn_content > getdate()-'30 days'::interval and
        tfc_action.user_id = tfc_learn_content.user_id and (
          ((tfc_action.sent_at - '5 minutes'::interval) < tfc_learn_content.event_at and (tfc_action.sent_at + '5 minutes'::interval) > tfc_learn_content.event_at) --OR
          -- (tfc_learn_content.event_at - '5 minutes'::interval) < tfc_action.sent_at and (tfc_learn_content.event_at + '5 minutes'::interval) > tfc_action.sent_at
        );;

  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [event_text, label, page_url]
  }
}
