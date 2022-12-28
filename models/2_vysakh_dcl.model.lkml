connection: "looker-dcl-data"

# include all the views
include: "/views/**/*.view"

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


explore: users {}
