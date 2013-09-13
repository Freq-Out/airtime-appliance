name "airtime"
description "Install Airtime"

run_list(
  "recipe[airtime::repository]"
)
