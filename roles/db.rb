name "db"
description "Database Server"

run_list(
  "recipe[database]",
  "recipe[postgresql]",
  "recipe[postgresql::server]"
)
