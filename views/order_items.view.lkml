# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
#  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;  }
  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;  }
  measure: count {
    type: count
#    drill_fields: [id, orders.id, inventory_items.id]
  }

  parameter: client_cohort_selection {
    label: "Client Cohort Selection"
    view_label: "Client"
    description: "Choose which cohort you would like to break out the metrics by."
    type: string
    default_value: "User Name"
    allowed_value: {value: "User Name"}
    allowed_value: {value: "User City"}
    allowed_value: {value: "User Zipcode"}
    allowed_value: {value: "User Country"}
    allowed_value: {value: "User Gender"}
  }

  dimension: client_cohort_display{
    label: "Client Cohort Display"
    view_label: "Client"
    label_from_parameter: client_cohort_selection
    type: string
    sql:
    CASE WHEN ({% parameter client_cohort_selection %} = 'User Name') THEN ${users.first_name}
         WHEN ({% parameter client_cohort_selection %} = 'User City') THEN ${users.city}
         WHEN ({% parameter client_cohort_selection %} = 'User Zipcode') THEN ${users.zip}
         WHEN ({% parameter client_cohort_selection %} = 'User Country') THEN ${users.country}
         WHEN ({% parameter client_cohort_selection %} = 'User Gender') THEN ${users.gender}
    END;;
  }
}
