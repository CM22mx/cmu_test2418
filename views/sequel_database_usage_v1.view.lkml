# The name of this view in Looker is "Sequel Database Usage V1"
view: sequel_database_usage_v1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.sequel_database_usage_v1 ;;
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
    # This dimension will be called "Build Name" in Explore.

  dimension: build_name {
    type: string
    sql: ${TABLE}.build_name ;;
  }

  dimension: method_name {
    type: string
    sql: ${TABLE}.method_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, build_name, method_name]
  }
}
