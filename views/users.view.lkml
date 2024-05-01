view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_total{
  type: number
  sql: case when ${id} is not null then 1 else 0 end;;

  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: show_my_dimension_filter_branch_name {

    # html: {% if _filters['age'] IS NOT "NULL"] %} 1 {% else %} 0 {% endif %};;

    type: number

    sql: 'this does nothing' ;;

  }

  # dimension: test2_1 {
  #   type: number
  #   html: {% if (${users.show_my_dimension_filter_branch_name}= 1, ${testmaxvalue}), 0) ;;
  #   sql: 0 ;;
  # }

  dimension: testing_test2 {
  type: number
  html: {{show_my_dimension_filter_branch_name._rendered_value}};;
    sql: 0 ;;

}


  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: flag_b{
  type:sum
  value_format: "0"
  sql: ${id_total} ;;

  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: yoy_takings_lfl_pct {
    value_format: "0.0%;(0.0%)"
    type: number
    sql: CASE WHEN SUM(${id}) > 2 THEN ((SUM(${age}) - SUM(${id}))/SUM(${id})) ELSE NULL END ;;
    html: {% if yoy_takings_lfl_pct._value >= 0 %}
          <p>{{yoy_takings_lfl_pct._value|times:100|round:1}}%</p>
          {% else %}
          <p style = "color: red">({{yoy_takings_lfl_pct._value |times:-100|round:1}}%)<p>
          {% endif %};; }

  measure: yoy_takings_lfl_pcts {
    value_format: "0.0%;(0.0%)"
    type: number
    sql: CASE WHEN SUM(${id}) > 2 THEN ((SUM(${age}) - SUM(${id}))/SUM(${id})) ELSE NULL END ;;
    html:
          <p style = "color: red">({{yoy_takings_lfl_pct._value |times:-100|round:1}}%)<p>
          ;; }
measure: ids {
  type: count_distinct
  sql: ${id} ;;
  value_format_name: "eur_0"
}
measure: xyz {
  type: sum
  sql: ${id} ;;
  value_format_name: "decimal_0"
}
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
