#
# Cookbook Name:: icecast2
# Recipe:: default
#
# Copyright 2013, Ronnie Garcia, OVEA, http://www.ovea.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install package
package "icecast2" do
  action :install
end

# enable and start service
service "icecast2" do
  action [:enable, :start]
end

# manage config file
template "/etc/icecast2/icecast.xml" do
  source "icecast.xml.erb"
  owner "root"
  group "icecast"
  mode 0640
  notifies :restart, "service[icecast2]"
end

# manage defaults file for initscript
template "/etc/default/icecast2" do
  source "icecast2.erb"
  owner "root"
  group "root"
  mode 0644
end
