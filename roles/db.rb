name "db"
description "Database Server"

run_list(
  "recipe[postgresql::server]",
  "recipe[database::postgresql]",
  "recipe[postgresql::client]",
)

override_attributes(
"postgresql" => {
    "initdb_locale"     => "en_US.UTF-8",
    "enable_pgdg_apt"   => true,
    "version"           => "9.3",
    "server" => {
      "packages"      => ["postgresql-9.3"],
      "service_name"  => "postgresql"
    },
    "client" => {
      "packages" => ["postgresql-client-9.3", "postgresql-contrib-9.3", "postgresql-server-dev-9.3"]
    }
  }
)

