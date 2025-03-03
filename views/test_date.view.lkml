# The name of this view in Looker is "Test Date"
view: test_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.Test_date ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_time ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Quantity" in Explore.

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;  }
  measure: average_quantity {
    type: average
    sql: ${quantity} ;;  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: times {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.times ;;
  }
  measure: count {
    type: count
  }
}
