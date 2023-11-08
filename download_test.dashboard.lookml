- dashboard: download_test
  title: download test
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lMU2nRjPkuqa9BzeueLLLV
  elements:
  - name: newNew
    title: newNew
    merged_queries:
    - model: 1_vysakh_dcl
      explore: order_items
      type: table
      fields: [users.id, users.last_name, users.postl_area_cde, users.state, inventory_items.created_date,
        inventory_items.cost, inventory_items.id, inventory_items.product_id, inventory_items.sold_at,
        inventory_items.count, order_items.count, products.count, users.age]
      limit: 500
    - model: 1_vysakh_dcl
      explore: order_items
      type: table
      fields: [users.id, users.last_name, users.postl_area_cde, users.gender, users.first_name,
        users.email, users.country, users.city, users.zip, users.count, orders.count,
        products.count]
      limit: 500
      query_timezone: Asia/Calcutta
      join_fields:
      - field_name: users.id
        source_field_name: users.id
      - field_name: users.postl_area_cde
        source_field_name: users.postl_area_cde
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: true
    size_to_fit: false
    series_cell_visualizations:
      inventory_items.count:
        is_active: true
    table_theme: gray

    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    row: 0
    col: 0
    width: 24
    height: 10
