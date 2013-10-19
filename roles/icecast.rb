name "icecast"
description "Install Icecast Server"

run_list(
  "recipe[icecast2]"
)

override_attributes(
"icecast2" => {
    "authentication" => {
      "source-password"  => "hackme",
      "relay-password"  => "hackme",
      "admin-user"      => "admin",
      "admin-password"  => "hackme"
    }
  }
)
