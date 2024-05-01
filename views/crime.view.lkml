view: crime {
  sql_table_name: `chicago_crime_data.crime` ;;

  dimension: arrest {
    type: yesno
    sql: ${TABLE}.arrest ;;
  }
  dimension: beat {
    type: number
    sql: ${TABLE}.beat ;;
  }
  dimension: block {
    type: string
    sql: ${TABLE}.block ;;
  }
  dimension: case_number {
    type: string
    sql: ${TABLE}.case_number ;;
  }
  dimension: community_area {
    type: number
    sql: ${TABLE}.community_area ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: district {
    type: number
    sql: ${TABLE}.district ;;
  }
  dimension: domestic {
    type: yesno
    sql: ${TABLE}.domestic ;;
  }
  dimension: fbi_code {
    type: string
    sql: ${TABLE}.fbi_code ;;
  }
  dimension: iucr {
    type: string
    sql: ${TABLE}.iucr ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: location_description {
    type: string
    sql: ${TABLE}.location_description ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: primary_type {
    type: string
    sql: ${TABLE}.primary_type ;;
  }
  dimension: unique_key {
    type: number
    sql: ${TABLE}.unique_key ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_on ;;
  }
  dimension: ward {
    type: number
    sql: ${TABLE}.ward ;;
  }
  dimension: x_coordinate {
    type: number
    sql: ${TABLE}.x_coordinate ;;
  }
  dimension: y_coordinate {
    type: number
    sql: ${TABLE}.y_coordinate ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
