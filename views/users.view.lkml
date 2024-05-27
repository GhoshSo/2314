view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  parameter: anything {
    type: unquoted
    suggest_dimension: city
    suggest_explore: users
  }
  dimension: dynamic {
    type: string
    sql: {% if anything._parameter_value != "" %} ${state}
      {% else %} ""
      {% endif %};;
  }

  measure: med_dest {
    type: percentile_distinct
    percentile: 75
    sql_distinct_key: ${first_name} ;;
    sql: ${age} ;;
  }

  dimension: city{
    #label: "city and the other thing just to make it long enough because...."
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [state, city]
    }
  dimension: country {
    #label: "country and the other thing just to make it long enough because"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: age {
    #label: "AGE is just a number but I'm not sure how to enlarge it as I'm out of word"
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension_group: created {
    #label: "I'm not sure who created the world but this dimension group is created by me"
    type: time
    #timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;

  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: lastest_response_date {
    group_label: "card_responses.response"
    label: "card_responses.lastest_response_date"
    type: date
    sql: max(${created_raw}) ;;
    html: {{ rendered_value | date: "%m/%d/%Y %r" }};;
  }
  measure: lastest_response_date_time {
    label: "card_responses.lastest_response_date_time"
    type: number
    sql: ${lastest_response_date} ;;
    html: <span style="color: black">{{ rendered_value | date: "%m/%d/%Y %r" }}</span>;;
  }


  measure: sum_id {
    type: sum
    value_format_name: decimal_2
    sql: ${id} ;;
  }
  measure: sum_age {
    type: sum
    value_format_name: decimal_2
    sql: ${age} ;;
  }

  measure: count {
    type: count
    #drill_fields: [detail*]
    drill_fields: [first_name, last_name,lastest_response_date_time]
    # link: {
    #   label: "chalega"
    #   url: "{{link}}&country=USA"
    # }
  }
  # dimension: det {
  #   sql:${orders.user_id} ;;
  # }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
