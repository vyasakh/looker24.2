- dashboard: drill_test
  title: drill test
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: RlgPHDHPbm2T9ihFt6vNN4
  elements:
  - title: drill test
    name: drill test
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_grid
    fields: [products.category, products.count]
    sorts: [category_wise_rank]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: pivot_row(${products.count})
      label: Pivot_list
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: pivot_list
      _type_hint: number_list
      is_disabled: true
    - category: table_calculation
      expression: sum(${pivot_list})
      label: Category_wise_total
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: category_wise_total
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: rank(${category_wise_total},${category_wise_total})
      label: Category_rank
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: category_rank
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: rank(${products.count},${products.count})
      label: category_wise_rank
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: category_wise_rank
      _type_hint: number
    - category: table_calculation
      expression: match(${products.category},${products.category})
      label: Category_match
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: category_match
      _type_hint: number
      is_disabled: true
    query_timezone: Africa/Bissau
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
