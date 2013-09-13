# This knife.rb populated as per http://help.opscode.com/discussions/questions/246-best-practices-for-multiple-developers-kniferb-in-chef-repo-or-not

current_dir    = File.dirname(__FILE__)
orgname        = 'freq-out'
ENV['ORGNAME'] = orgname
user           = ENV['OPSCODE_USER'] || ENV['USER']
log_level              :info
log_location           STDOUT
cache_type             'BasicFile'
cache_options          :path => "#{current_dir}/checksums"
cookbook_path          ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
require 'librarian/chef/integration/knife'
cookbook_path          ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks", Librarian::Chef.install_path]
cookbook_copyright     "Freq-Out"
cookbook_license       "All Right Reserved"
cookbook_email         "contact@freq-out.com"

