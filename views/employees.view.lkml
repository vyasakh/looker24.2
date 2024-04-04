view: employees {
  sql_table_name: demo_db.Employees ;;

  dimension: emp_id {
    type: number
    sql: ${TABLE}.EmpID ;;
  }
  dimension: manager {
    type: number
    sql: ${TABLE}.Manager ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
  dimension: conversation_details {
    sql: "View SMS Conversation" ;;
    html:
      {% if value == 'View SMS Conversation' %}}
        <a target="_blank" href="/embed/dashboards/322?Name={{['employees.name']|replace: '&#39;', "'"|replace: '&amp;', '&'| url_encode}}">{{value}}</a>
      {% endif %}
    ;;
  }
  dimension: more_details {
    sql: "Click here for more details" ;;
    link: {
      label: "Conversation View"
      url: "/embed/dashboards/323?Name={{_filters['employees.name'] | url_encode}}"
    }
  }
}
