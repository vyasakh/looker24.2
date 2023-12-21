view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension: sysdate {
    type: date
    sql:now() ;;
  }

  dimension: systime {
    type: date_time
    sql: now() ;;
  }
  dimension: sysdate_substring {
    type: string
    sql: substring(${systime},1,10) ;;
  }
  dimension: sysdatetime_substring {
    type: string
    sql: substring(${systime},1,13) ;;
  }
  measure: total_sales_price {
    type: sum
    sql: ${sale_price};;
    value_format: "0"

  }
  measure: test_percentage {
    type: percent_of_total
    sql: ${sale_price} ;;

  }


  measure: toatl_sum_price {
    type: sum
    sql: (${sale_price}>0 or ${sale_price}<0) ;;
  }

  measure: perc_check {
    type: number
    sql: sum(${sale_price})/9846 ;;
  }


 measure: id_distinct {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }


}
