- dashboard: ecommerce_sales_dashboard
  title: E-Commerce Sales Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 4vKXJ4C7NFE9eqLIhCw1wv
  elements:
  - title: New User -
    name: New User -
    model: souvik2314
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      orders.created_date: 180 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '10000'
      label: Target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: "#592EC2"
    single_value_title: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 4
  - title: Average Sale Price
    name: Average Sale Price
    model: souvik2314
    explore: order_items
    type: single_value
    fields: [order_items.avg_sp]
    filters:
      orders.created_date: 6 months
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '100000'
      label: Target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: '500'
      label: target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target_1
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 4
  - title: This Year Total Sale
    name: This Year Total Sale
    model: souvik2314
    explore: order_items
    type: single_value
    fields: [order_items.returned_year, order_items.total_sp]
    fill_fields: [order_items.returned_year]
    filters:
      order_items.returned_year: 2018/01/01 to 2019/12/31
    sorts: [order_items.returned_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '100000'
      label: Target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${order_items.total_sp}/offset(${order_items.total_sp},1)-1"
      label: percentage change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: This Year Total Sale
    comparison_label: Vs. Last Year
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 4
  - title: Monthly Trend of Users
    name: Monthly Trend of Users
    model: souvik2314
    explore: order_items
    type: looker_column
    fields: [users.count, users.created_month_name, users.created_year]
    pivots: [users.created_year]
    fill_fields: [users.created_year]
    filters:
      users.created_year: 2016/01/01 to 2019/12/31
      users.created_month_name: January,February,March,April,May,June,July,August,September,October,November,December
    sorts: [users.count desc 0, users.created_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '100000'
      label: Target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${order_items.total_sp}/offset(${order_items.total_sp},1)-1"
      label: percentage change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: mean(pivot_row(${users.count}))
      label: monthly trend (average)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: monthly_trend_average
      _type_hint: number
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      monthly_trend_average: line
    series_colors:
      2016 - users.count: "#ff5b1d"
      2017 - users.count: "#320dff"
      expected_average: "#626666"
      monthly_trend_average: "#1d1d2b"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: This Year Total Sale
    defaults_version: 1
    hidden_pivots:
      '2019':
        is_entire_pivot_hidden: true
    listen: {}
    row: 4
    col: 0
    width: 12
    height: 9
  - title: Category of Product sold in Each month
    name: Category of Product sold in Each month
    model: souvik2314
    explore: order_items
    type: looker_area
    fields: [orders.count, products.category, orders.created_month]
    pivots: [products.category]
    fill_fields: [orders.created_month]
    filters:
      orders.created_year: 2020/01/01 to 2023/12/31
      products.category: Accessories,Jeans,Pants,Skirts,Leggings,Intimates
    sorts: [products.category, orders.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '100000'
      label: Target
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: target
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${order_items.total_sp}/offset(${order_items.total_sp},1)-1"
      label: percentage change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: mean(pivot_row(${users.count}))
      label: monthly trend (average)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: monthly_trend_average
      _type_hint: number
      is_disabled: true
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      2016 - users.count: "#ff5b1d"
      2017 - users.count: "#320dff"
      expected_average: "#626666"
      monthly_trend_average: "#1d1d2b"
      Intimates - orders.count: "#ff340c"
      Jeans - orders.count: "#fffe29"
      Leggings - orders.count: "#ff1bf4"
      Pants - orders.count: "#3dff52"
      Skirts - orders.count: "#9843ff"
    ordering: none
    show_null_labels: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: This Year Total Sale
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 4
    col: 12
    width: 12
    height: 9
