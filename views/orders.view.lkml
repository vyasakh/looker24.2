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
    timeframes: [raw, time, date, week, month, quarter, year, week_of_year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    required_access_grants: [alert]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: testtt {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id * 0.007;;
  }
  measure: testwithmeasure{
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id * 0.007;;
  }




  parameter: test {
    type: unquoted
    allowed_value: {
      label: "Daywise data"
      value: "day"
    }
    allowed_value: {
      label: "Monthwise data"
      value: "month"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  # dimension: testtt1 {
  #   type: number
  #   # hidden: yes
  #   sql: ${TABLE}.user_id * 0.007;;
  # }
  # measure: testwithmeasure2{
  #   type: number
  #   # hidden: yes
  #   sql: ${TABLE}.user_id * 0.007;;
  # }



  dimension: accent {
    type: string
    sql: 'Festive | Tải menu' ;;
  }
  measure: condition {
    type: number
    sql: case when ${status}= "COMPLETED" Then "1"
    else "0"
    end;;
  }

  measure: testmedian {
    type: sum
    sql: ${id} ;;
  }

  measure: order_count {
    type: count_distinct
    drill_fields: [created_year,order_count, users.gender]
    link: {
      label: "drill by pivot"
      url: "{{link}}&pivots=orders.status"
    }
    sql: ${id} ;;
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
