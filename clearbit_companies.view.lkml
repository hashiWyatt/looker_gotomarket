view: clearbit_companies {

  sql_table_name: clearbit.companies ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }
}
