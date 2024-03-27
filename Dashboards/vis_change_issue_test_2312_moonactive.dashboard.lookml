---
- dashboard: viz_change_issue_test_from_2312_moonactive
  title: Viz_change Issue Test from 2312 (MoonActive)
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: PNT6H4dlyvdULLMoyHHCcz
  elements:
  - title: Viz_change Issue Test from 2312 (MoonActive)
    name: Viz_change Issue Test from 2312 (MoonActive)
    model: souvik2314
    explore: orders
    type: looker_line
    fields: [orders.status_gen, orders.count, orders.created_year]
    pivots: [orders.status_gen]
    fill_fields: [orders.created_year]
    filters: {}
    sorts: [orders.count desc 0, orders.status_gen]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(pivot_row(${orders.count}))
      label: pivoted_sum
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: pivoted_sum
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
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      COMPLETED male - orders.count: column
      COMPLETED f - orders.count: column
      CANCELLED male - orders.count: column
      CANCELLED m - orders.count: column
      CANCELLED f - orders.count: column
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Status Gen: orders.status_gen
      Created Year: orders.created_year
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: 2020/01/01 to 2023/11/20
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: souvik2314
    explore: orders
    listens_to_filters: []
    field: orders.created_year
  - name: Status Gen
    title: Status Gen
    type: field_filter
    default_value: CANCELLED f,CANCELLED m,CANCELLED male,COMPLETED f,COMPLETED male
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: souvik2314
    explore: orders
    listens_to_filters: []
    field: orders.status_gen
