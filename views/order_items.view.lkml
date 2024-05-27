include: "/views/orders.view.lkml"
view: order_items {

  extends: [orders]
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]




  parameter: exclude_royalties {
    #view_label: " Revenue metrics"
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

  dimension: test878558 {

    type: number

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




  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, week_of_year, month, quarter, year,month_name]
    sql: ${TABLE}.returned_at ;;
    #html: {{ rendered_value | date: "%Y-%d-%m"}} ;;
  }

  dimension: returned_form_date {
    type: date
    sql: ${returned_date} ;;

    }

  dimension: formatted_returned {
    type: string
    sql: CONCAT(${returned_date}," T",SUBSTR(${returned_raw},12,12),".000") ;;
  }



  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension: new_SP {
    type: number
    sql: ${sale_price}*1000000000000;;
  }
  measure: sdsp {
    label: "Sum Distict of New SP"
    type: sum_distinct
    sql: ${new_SP} ;;
    precision: 5
    value_format: "$0"
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
    description: "{{order_items.date._value}}"
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }





}
