view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    link: {
      label: "City Metrics Explore"
      url: "https://gcpl2320.cloud.looker.com/explore/0_vysakh_thelook/users?fields=users.city,orders.count,users.count&f[users.city]=&sorts=orders.count+desc&limit=500"
    }
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
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }



  parameter: date_granularity {
    type: unquoted
    default_value: "day"
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }

  dimension: date1 {
    label_from_parameter: date_granularity
    label: "dummy"
    type: string
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${created_date}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${created_month}
    {% else %}
      ${created_date}
    {% endif %};;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name},${last_name}) ;;
  }

  dimension: length {
    type: number
    sql: length(${full_name}) ;;
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
