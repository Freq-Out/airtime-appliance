name "base"
description "Basic Stuff"

run_list(
  "recipe[apt]",
  "recipe[ubuntu]"
)

override_attributes(
"ubuntu" => {
    "archive_url" => "http://fr.archive.ubuntu.com/ubuntu"
  }
)
  