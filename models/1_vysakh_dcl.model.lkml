connection: "looker-dcl-data"

# include all the views
include: "/views/**/*.view"
include: "/download_test.dashboard.lookml"
include: "/download_test11.dashboard.lookml"

datagroup: 1_vysakh_dcl_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 1_vysakh_dcl_default_datagroup

map_layer: UK_postcode_NOrepetitions_topojson {
  property_key: "Post_code"
  file: "/models/UK_postcode_NOrepetitions_topojson.json"
  format: topojson
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: orders {
  #fields: [ALL_FIELDS*, -orders.count_male]
  join: order_items{

    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }


}


explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: products {}
