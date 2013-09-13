name "web"
description "HTTP Server"

run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_php5]"
)
