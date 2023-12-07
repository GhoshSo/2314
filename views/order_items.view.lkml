view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  ## BBCD
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, week_of_year, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: round(${TABLE}.sale_price) ;;
  }
  measure: total_sp {
    type: number
    sql: SUM(${sale_price}) ;;
    # #html: <p><font color="#005AB2">{{rendered_value}} </font> </p> ;;
     link: {
       label: "Count"
       url: " {% assign vis_config = '{\"type\":\"looker_scatter\"}' %}
       {{ count._link }}&vis_config={{ vis_config | encode_uri }}&&toggle=vis"
     }
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  measure: div {
    type: number
    sql: ${total_sp}/${count_dis} ;;
  }

  measure: count_dis {
    type: number
    sql: COUNT( DISTINCT(${order_id})) ;;
  }

}
