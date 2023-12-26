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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
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

  dimension: date1 {
    label_from_parameter: test
    label: "liquid"
    sql:
    {% if test._parameter_value == 'day' %}
      ${created_date}
    {% elsif test._parameter_value == 'month' %}
      ${created_month}
    {% else %}
      ${created_date}
    {% endif %};;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
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
