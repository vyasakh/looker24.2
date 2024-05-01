connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: 0_vysakh_bq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 0_vysakh_bq_default_datagroup

explore: crime {
}
#test1
explore: crime_partitioned_1 {}

#####
