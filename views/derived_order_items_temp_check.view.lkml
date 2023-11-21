
view: derived_order_items_temp_check {
  derived_table: {
    sql: SELECT
          (DATE_FORMAT(TIMESTAMP(CONCAT(CAST(YEAR(CONVERT_TZ(order_items.returned_at ,'UTC','America/Los_Angeles')) AS CHAR), '-', LPAD(CAST(((QUARTER(CONVERT_TZ(order_items.returned_at ,'UTC','America/Los_Angeles')) - 1) * 3) + 1 AS CHAR), 2, '0'), '-01')),'%Y-%m')) AS `order_items.returned_quarter`,
              (YEAR(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles'))) AS `orders.created_year`,
          concat(orders.status, " ",users.gender)  AS `orders.status_gen`,
          order_items.order_id  AS `order_items.order_id`,
          orders.status  AS `orders.status`,
          products.category  AS `products.category`,
          products.brand  AS `products.brand`,
          products.rank  AS `products.rank`,
          users.city  AS `users.city`,
          users.state  AS `users.state`,
          COUNT(DISTINCT products.id ) AS `products.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id
      WHERE {% condition user_state %} users.state {% endcondition %}
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  filter: user_state {
    suggest_dimension: users_state
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_returned_quarter {
    type: string
    sql: ${TABLE}.`order_items.returned_quarter` ;;
  }

  dimension: orders_created_year {
    type: number
    sql: ${TABLE}.`orders.created_year` ;;
  }

  dimension: orders_status_gen {
    type: string
    sql: ${TABLE}.`orders.status_gen` ;;
  }

  dimension: order_items_order_id {
    type: number
    sql: ${TABLE}.`order_items.order_id` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}.`products.category` ;;
  }

  dimension: products_brand {
    type: string
    sql: ${TABLE}.`products.brand` ;;
  }

  dimension: products_rank {
    type: number
    sql: ${TABLE}.`products.rank` ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.`users.city` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  dimension: products_count {
    type: number
    sql: ${TABLE}.`products.count` ;;
  }

  set: detail {
    fields: [
        order_items_returned_quarter,
  orders_created_year,
  orders_status_gen,
  order_items_order_id,
  orders_status,
  products_category,
  products_brand,
  products_rank,
  users_city,
  users_state,
  products_count
    ]
  }
}
