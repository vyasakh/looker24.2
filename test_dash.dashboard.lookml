---
- dashboard: d3_sm_cancel_noshow_rebook_basic
  title: sort_test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: wWfXs2oQyg4K9auaqb14xv
  elements:
  - title: sort_test
    name: sort_test
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.count, products.id, orders.status]
    pivots: [orders.status]
    sorts: [orders.status, order_items.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(pivot_index(${order_items.count},1)-pivot_index(${order_items.count},2))/pivot_index(${order_items.count},2)"
      label: YOY change
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: yoy_change
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    hidden_pivots: {}
    minimum_column_width: 75
    column_order: ["$$$_row_numbers_$$$", products.id, COMPLETED_order_items.count,
      orders.status___null_order_items.count, PENDING_order_items.count, CANCELLED_order_items.count,
      yoy_change]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This is a test of a tootip '
    listen: {}
    row: 0
    col: 0
    width: 11
    height: 6
  - title: New Tile2
    name: New Tile2
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.count, products.id, orders.status]
    pivots: [orders.status]
    sorts: [orders.status, order_items.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(pivot_index(${order_items.count},1)-pivot_index(${order_items.count},2))/pivot_index(${order_items.count},2)"
      label: YOY change
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: yoy_change
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    hidden_pivots: {}
    minimum_column_width: 75
    column_order: ["$$$_row_numbers_$$$", products.id, COMPLETED_order_items.count,
      orders.status___null_order_items.count, PENDING_order_items.count, CANCELLED_order_items.count,
      yoy_change]
    y_axes: []
    listen: {}
    row: 6
    col: 0
    width: 11
    height: 6
