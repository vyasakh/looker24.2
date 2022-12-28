- dashboard: status_dashboard
  title: Status Dashboard
  layout: static
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: lcEsTIBQyNIqPeP6HFu7C8
  elements:
  - title: New Tile
    name: New Tile
    model: 1_vysakh_dcl
    explore: order_items
    type: looker_column
    fields: [products.department, products.category, products.count]
    pivots: [products.department]
    filters:
      orders.status: complete
    sorts: [products.department, products.count desc 2]
    limit: 500
    total: true
    row_total: right
    dynamic_fields: [{args: [products.count], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: products.count, label: Percent change
          from previous - Products Count, source_field: products.count, table_calculation: percent_change_from_previous_products_count,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    y_axes: []
    listen:
      ID: order_items.id
    row: 0
    col: 0
    width: 23
    height: 11
  - title: New Tile
    name: New Tile (2)
    model: 1_vysakh_dcl
    explore: order_items
    type: looker_grid
    fields: [orders.group_name_link]
    sorts: [orders.group_name_link]
    limit: 500
    query_timezone: Asia/Calcutta
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
    series_types: {}
    listen:
      ID: order_items.id
    row: 11
    col: 0
    width: 8
    height: 6
  filters:
  - name: ID
    title: ID
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: 1_vysakh_dcl
    explore: order_items
    listens_to_filters: []
    field: order_items.id
