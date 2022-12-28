include: "/views/orders.view.lkml"
view: orders_extended {
extends: [orders]

  measure: count_male {
    type: count
    drill_fields: [id, users.id, users.first_name, order_items.count]
    filters: [users.gender: "m" ]
  }

}
