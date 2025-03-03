# The name of this view in Looker is "Special Charaters"
view: special_charaters {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.special_charaters ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Special String" in Explore.

  dimension: special_string {
    type: string
    sql: ${TABLE}.special_string ;;
  }
  measure: count {
    type: count
  }
}
