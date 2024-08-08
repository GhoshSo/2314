view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  parameter: status_dim_selector{
    type: string
    allowed_value: {
      label: "Status - Pending"
      value: "pending"
    }
    allowed_value: {
      label: "Status - Cancelled"
      value: "cancelled"
    }
    allowed_value: {
      label: "Status - Completed"
      value: "completed"
    }
  }

  # dimension: variable_dim {
  #   type: string
  #   sql: {% if status_dim_selector._parameter_value == "statusgen" %}
  #             ${status_gen}
  #       {% elsif status_dim_selector._parameter_value == "status" %}
  #             ${status}
  #       {% endif %} ;;
  # }



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
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    drill_fields: [id,user_id,users.first_name,users.last_name,count]
    link: {
      label: "dashboard"
      url: "https://gcpl246.cloud.looker.com/dashboards/28"
    }

    link: {
      label: "dashbaord"
      url: "https://gcpl246.cloud.looker.com/dashboards/62"
    }
 }
  # measure: count {
  #   type: count
  #   #drill_fields: [detail*]
  # }

  # dimension: action_test {
  #   sql: ${status} ;;
  #   action:  {
  #     label: "Label to Appear in Action Menu"
  #     url: "https://example.com/posts"
  #     icon_url: "https://looker.com/favicon.ico"
  #     form_url: "https://example.com/ping/{{ value }}/form.json"
  #     param: {
  #       name: "name string"
  #       value: "value string"
  #     }
  #     form_param: {
  #       name:  "name string"
  #       type:string
  #       label:  "possibly-localized-string"
  #       option: {
  #         name:  "name string"
  #         label:  "possibly-localized-string"
  #       }
  #       required:  yes
  #       description:  "possibly-localized-string"
  #       default:  "string"
  #     }
  #     user_attribute_param: {
  #       user_attribute: locale
  #       name: "name_for_json_payload"
  #     }
  #   }
  # }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: status_gen {
    type: string
    sql: concat(${status}, " ",${users.gender}) ;;
  }

  dimension: bbcd {
    type: yesno
    sql: ${status}="PENDING" AND ${id} IS NOT NULL ;;
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
    drill_fields: [status, users.first_name, detail*]
    link: {
      url: "{{ link }}&sorts=users.first_name+desc&limit=20"
    }
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
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
