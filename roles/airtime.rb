name "airtime"
description "Install Airtime"

run_list(
  "recipe[airtime::database]",
  "recipe[airtime::repository]"
)

override_attributes(
"airtime" => {
    "version"     => "2.5.1-3"
  }
)
