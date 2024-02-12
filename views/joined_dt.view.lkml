
view: joined_dt {
  derived_table: {
    sql: SELECT
          (DATE(CONVERT_TZ(`events`.`created_at`,'UTC','America/Los_Angeles'))) AS `events.created_date`,
          `events`.`id` AS `events.id`,
          `events`.`type_id` AS `events.type_id`,
          `events`.`user_id` AS `events.user_id`,
          `events`.`value` AS `events.value`,
          `test_join`.`age` AS `test_join.age`,
          `test_join`.`city` AS `test_join.city`,
          `test_join`.`country` AS `test_join.country`,
              (DATE(CONVERT_TZ(`test_join`.`created_at`,'UTC','America/Los_Angeles'))) AS `test_join.created_date`,
          `test_join`.`email` AS `test_join.email`,
          `test_join`.`gender` AS `test_join.gender`,
          `test_join`.`first_name` AS `test_join.first_name`,
          `test_join`.`id` AS `test_join.id`,
          `test_join`.`last_name` AS `test_join.last_name`,
          `test_join`.`state` AS `test_join.state`,
          `test_join`.`zip` AS `test_join.zip`,
          COUNT(DISTINCT events.id ) AS `events.count`,
          COUNT(DISTINCT test_join.id ) AS `test_join.count`
      FROM
          `demo_db`.`users` AS `test_join`
          LEFT JOIN `demo_db`.`events` AS `events` ON `test_join`.`id` = `events`.`id`
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: events_created_date {
    type: date
    sql: ${TABLE}.`events.created_date` ;;
  }

  dimension: events_id {
    type: number
    sql: ${TABLE}.`events.id` ;;
  }

  dimension: events_type_id {
    type: number
    sql: ${TABLE}.`events.type_id` ;;
  }

  dimension: events_user_id {
    type: number
    sql: ${TABLE}.`events.user_id` ;;
  }

  dimension: events_value {
    type: string
    sql: ${TABLE}.`events.value` ;;
  }

  dimension: test_join_age {
    type: number
    sql: ${TABLE}.`test_join.age` ;;
  }

  dimension: test_join_city {
    type: string
    sql: ${TABLE}.`test_join.city` ;;
  }

  dimension: test_join_country {
    type: string
    sql: ${TABLE}.`test_join.country` ;;
  }

  dimension: test_join_created_date {
    type: date
    sql: ${TABLE}.`test_join.created_date` ;;
  }

  dimension: test_join_email {
    type: string
    sql: ${TABLE}.`test_join.email` ;;
  }

  dimension: test_join_gender {
    type: string
    sql: ${TABLE}.`test_join.gender` ;;
  }

  dimension: test_join_first_name {
    type: string
    sql: ${TABLE}.`test_join.first_name` ;;
  }

  dimension: test_join_id {
    type: number
    sql: ${TABLE}.`test_join.id` ;;
  }

  dimension: test_join_last_name {
    type: string
    sql: ${TABLE}.`test_join.last_name` ;;
  }

  dimension: test_join_state {
    type: string
    sql: ${TABLE}.`test_join.state` ;;
  }

  dimension: test_join_zip {
    type: number
    sql: ${TABLE}.`test_join.zip` ;;
  }

  dimension: events_count {
    type: number
    sql: ${TABLE}.`events.count` ;;
  }

  dimension: test_join_count {
    type: number
    sql: ${TABLE}.`test_join.count` ;;
  }

  set: detail {
    fields: [
      events_created_date,
      events_id,
      events_type_id,
      events_user_id,
      events_value,
      test_join_age,
      test_join_city,
      test_join_country,
      test_join_created_date,
      test_join_email,
      test_join_gender,
      test_join_first_name,
      test_join_id,
      test_join_last_name,
      test_join_state,
      test_join_zip,
      events_count,
      test_join_count
    ]
  }
}
