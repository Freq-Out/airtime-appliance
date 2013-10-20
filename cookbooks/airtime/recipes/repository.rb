#
# Cookbook Name:: airtime
# Recipe:: repository
#
# Copyright 2013, Freq-Out
#

apt_repository "airtime" do
  uri "http://apt.sourcefabric.org/"
  distribution node['lsb']['codename']
  components ["main"]
  action :add
end

package "sourcefabric-keyring" do
  action :install
  options "--force-yes"
end

package "airtime" do
  action :install
  options "--force-yes"
end