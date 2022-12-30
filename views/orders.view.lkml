view: orders {
    dimension: id {
      description: ""
      type: number
    }
    dimension: count {
      description: ""
      type: number
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
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: ids{
    type: string
    sql: concat(${id}," ",${id})  ;;
  }

}
