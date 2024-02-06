include: "/views/orders.view.lkml"
view: order_items {
  extends: [orders]
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  parameter: ABC {
    label: "DEF"
    type: unquoted
    allowed_value: {
      value: "123"
      label: "!@#"
    }
    allowed_value: {
      value: "456"
      label: "$%^"
    }
  }

  parameter: exclude_royalties {
    view_label: " Revenue metrics"
    type: number
    default_value: "1"
    description: "Filter to include/exclude royalties, default is NO"
    label: "Exclude royalties?"
    allowed_value: {
      label: "Include royalties"
      value: "1"
    }
    allowed_value: {
      label: "Exclude royalties"
      value: "0"
    }
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

  measure: dynamic_measure {
    #label_from_parameter: measure_selector
    type: number
    sql:
      {% if ABC._parameter_value == 123 %} ${count}
      {% else %} ${total_sp}
      {% endif %};;
  }


  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, week_of_year, month, quarter, year,month_name]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: returned_month_pro {
    type: string
    #sql: ${returned_date} ;;
    sql: SUBSTRING(CONCAT(SUBSTRING(${returned_month},6,7),"-",SUBSTRING(${returned_month},3,4)),1,5) ;;
    #html: {{ rendered_value | date: "%b-%y" }} ;;
  }

  dimension: sale_price {
    type: number
    sql: round(${TABLE}.sale_price) ;;
  }
  measure: avg_sp {
    type: average
    sql: ${sale_price} ;;
    value_format: "$#.00;($#.00)"
  }
  measure: total_sp {
    type: number
    sql: SUM(${sale_price}) ;;
    # #html: <p><font color="#005AB2">{{rendered_value}} </font> </p> ;;
     link: {
       label: "Count"
       url: " {% assign vis_config = '{\"type\":\"single_value\"}' %}
       {{ count._link }}&vis_config={{ vis_config | encode_uri }}&&toggle=vis"
     }
    value_format: "$#.00;($#.00)"
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
