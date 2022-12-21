view: orders {
  sql_table_name: `orders.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
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

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, order_items.count]
  }


  measure: ocountss {
    type: number
    drill_fields: [id, users.id, users.first_name, order_items.count]
    value_format_name: percent_1
    sql: ${count}/10000 ;;
  }

  dimension: group_name_link {
    group_label: "Looker Links"
    label: "Group Name"
    type: string
    description: "Link to YD Detail"
    sql: concat('https://lyte.looker.com/dashboards/1407?Account+ID=',${TABLE}.id) ;;
    html: <a href="{{value}}">test</a>;;
  }
}
