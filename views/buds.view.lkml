# The name of this view in Looker is "Buds"
view: buds {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.buds ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Budget Amount" in Explore.

  dimension: budget_amount {
    type: number
    sql: ${TABLE}.budget_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_budget_amount {
    type: sum
    sql: ${budget_amount} ;;  }
  measure: average_budget_amount {
    type: average
    sql: ${budget_amount} ;;  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
