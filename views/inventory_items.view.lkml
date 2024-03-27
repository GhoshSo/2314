view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: sold {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sold_at ;;
  }
  measure: count {
    type: number
    html:
    {% assign code_value = users.city._rendered_value %}
{% assign code_value_desc = users.country._rendered_value %}
    {% if value > 0 %}
    <div style="color: #555555;">
    <h3 style="font-size: 30px;font-weight: 500;">{{rendered_value}}</h3>
    <h4 style="white-space:nowrap; text-overflow: ellipsis;overflow: hidden;">{{code_value}}</h4>
    <h4>Code: {{code_value_desc}}</h4>
    </div>
    {% else %}
    <div style="color: #000;font-size: 15px;font-weight: 500;text-align: center;">
    <p>No data for this selection</p>
    </div>
    {% endif %}
    ;;
    drill_fields: [id, products.id, products.item_name, order_items.count, order_items_vijaya.count]
  }
  dimension: sale_price_testt {
    type: number
    sql: ${order_items.sale_price}  ;;
  }
  dimension: test_souvik {
    type: number
    sql: 100 ;;
  }
  dimension: test456 {

    type: number
  }
}
