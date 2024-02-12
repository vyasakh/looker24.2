view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
dimension: test_url {
  type: string
  sql: ${TABLE} ;;


}
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  measure: sale_sum {
    type: sum
    sql: ${retail_price} ;;
    value_format_name: usd_0
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    link: {
      label: "Explore Top 1000 Results"
      url: "{{ link }}&limit=1000"
    }

  }
  measure: retails {
    type: number
    sql: IF(sum(${retail_price}) > 0, sum(${retail_price})/1000, 0);;
  }

}
