view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  parameter: number_of_results {
    type: string
    allowed_value: {
      label: "Less than 500"
      value: "< 500"
    }
    allowed_value: {
      label: "Less than 10,000"
      value: "< 10000"
    }
    allowed_value: {
      label: "All Results"
      value: "> 0"
    }
  }

  #### This line is added by souvik

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
  dimension: status_gen {
    type: string
    sql: concat(${status}, " ",${users.gender}) ;;
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
