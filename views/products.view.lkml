view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql:  ${TABLE}.retail_price ;;
  }
  dimension: retail_price1 {
    type: number
    sql: CASE WHEN (${TABLE}.retail_price > 6) THEN 1 ELSE 0 END ;;
    #sql: ${TABLE}.retail_price ;;
    html:
     {% assign code_value = item_name._value %}
{% assign code_value_desc = rank._rendered_value %}
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

  }


  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
