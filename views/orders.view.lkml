view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month,month_name, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: oders_year {
    type: date_year
    sql: ${created_year} ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status;;
  }
  measure: cancelled_to_0 {
    type: number
    sql:  case when ${status}="CANCELLED" then 0 else ${count} end ;;
  }
  measure: cancelled_to_null {
    type: number
    sql:  case when ${status}="CANCELLED" then null else ${count} end ;;
  }
  dimension: status_check {
    type: string
    sql: group_concat(${status}.COMPLETED, ${status}.CANCELLED);;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: field_name {
    html: <img src="https://in.pinterest.com/pin/346847608815478395/image.jpg"/> ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
