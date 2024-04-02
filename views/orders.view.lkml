view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  parameter: status_dim_selector{
    type: unquoted
    allowed_value: {
      label: "Status With Gender"
      value: "statusgen"
    }
    allowed_value: {
      label: "Only Status"
      value: "status"
    }
  }

  dimension: variable_dim {
    type: string
    sql: {% if status_dim_selector._parameter_value == "statusgen" %}
               ${status_gen}
         {% elsif status_dim_selector._parameter_value == "status" %}
               ${status}
         {% endif %} ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

  }

  measure: id_test {
    type: number
    sql: ${id} ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  measure: created_max {
    type: max
    sql: ${created_date} ;;
  }
  measure: created_max_2 {
    type:  string
    sql: DATE(MAX(${created_raw})) ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
 }

  dimension: status_gen {
    type: string
    sql: concat(${status}, " ",${users.gender}) ;;
  }

  filter: test{
    type: string
    sql: ${status} ;;
    suggest_dimension: status_gen
    suggest_explore: orders
  }
  dimension: status_charindex {
    type: number
    sql: POSITION('e'IN ${status}) ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: now {
    type: date_time
    sql: NOW() ;;
  }
  measure: sum_id {
    type: number
    sql: SUM(${user_id}) ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }
dimension: test798 {
  type: number
  sql: 1 ;;
}
}
