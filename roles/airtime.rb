name "airtime"
description "Install Airtime"

run_list(
  "recipe[airtime::database]",
  "recipe[airtime::repository]"
)
