# The name of this view in Looker is "Thor"
view: thor {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.thor ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bit Column" in Explore.

  dimension: bit_column {
    type: string
    sql: ${TABLE}.bit_column ;;
  }
  measure: count {
    type: count
  }
}
