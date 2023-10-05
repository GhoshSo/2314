connection: "snowlooker"

datagroup: souvik_snowlooker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: souvik_snowlooker_default_datagroup

