
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          users.gender  AS `users.gender`,
          users.city  AS `users.city`,
          COUNT(*) AS `users.count`
      FROM demo_db.users  AS users
       where {% condition filter %}users_city{% endcondition %};;
  }
filter: filter {
  type: string
}
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_gender {
    type: string
    sql: ${TABLE}.`users.gender` ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.`users.city` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [
        users_gender,
  users_city,
  users_count
    ]
  }
}
