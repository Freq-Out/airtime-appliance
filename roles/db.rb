name "db"
description "Database Server"

run_list(
  "recipe[postgresql::server]",
  "recipe[database::postgresql]",
  "recipe[postgresql::client]",
)

override_attributes(
"postgresql" => {
    "initdb_locale"     => "en_US.UTF-8"
  }
)

