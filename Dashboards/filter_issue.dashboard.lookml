---
- dashboard: filter_issue
  title: Filter Issue
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: sZEvI1taf5cfUnHR36KzAT
  elements:
  - name: Filter Issue
    title: Filter Issue
    merged_queries:
    - model: souvik2314
      explore: order_items
      type: looker_column
      fields: [users.count, users.created_month_name, users.created_year]
      filters:
        users.created_year: 2016/01/01 to 2019/12/31
        users.created_month_name: January,February,March,April,May,June,July,August,September,October,November,December
        orders.created_date: 2020/06/03 to 2024/04/24
        orders.status_gen: ''
        orders.status: PENDING
      sorts: [users.count desc, users.created_year]
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
      hidden_pivots: {}
      y_axes: []
    - model: 0_vysakh_thelook
      explore: order_items
      type: table
      fields: [users.count, users.created_year]
      fill_fields: [users.created_year]
      sorts: [users.created_year desc]
      limit: 500
      column_limit: 50
      query_timezone: UTC
      join_fields:
      - field_name: users.created_year
        source_field_name: users.created_year
    type: table
    listen:
    - Mark: users.count
      Created Year: order_items.created_year
    - Mark: users.count
      Created Year: users.created_year
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: souvik2314
    explore: order_items
    listens_to_filters: []
    field: order_items.created_year
  - name: Mark
    title: Mark
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: 0_vysakh_thelook
    explore: order_items
    listens_to_filters: []
    field: users.count
