name "db"
description "Database Server"

run_list(
  "recipe[database]",
  "recipe[postgresql]",
  "recipe[postgresql::ruby]",
  "recipe[postgresql::server]"
)

override_attributes(
"postgresql" => {
    "initdb_locale"      => "en_US.UTF-8"
  }
)
