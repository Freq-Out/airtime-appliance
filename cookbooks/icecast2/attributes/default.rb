#
# Cookbook Name:: icecast2
# Attributes:: default
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

# initscript default file parameters (/etc/default/icecast2)
# default userid and groupid (name or ID) the daemon should *start* under
# you may override it to root/root if you need to bind a <1024 port, then set bellow
# node['icecast2']['security']['changeowner']['user'] and
# node['icecast2']['security']['changeowner']['group']
# to something like icecast2/icecast, so the icecast daemon drops privileges right after
default['icecast2']['userid'] = "icecast2"
default['icecast2']['groupid'] = "icecast"

# main icecast2 config file parameters (/etc/icecast2/icecast.xml)
# default server limits
default['icecast2']['limits']['clients'] = 100
default['icecast2']['limits']['sources'] = 2
default['icecast2']['limits']['threadpool'] = 5
default['icecast2']['limits']['source-timeout'] = 10

# default server authentication
default['icecast2']['authentication']['source-password'] = "emgnz7k2"
default['icecast2']['authentication']['relay-password'] = "4kdfg2o9"
default['icecast2']['authentication']['admin-user'] = "admin"
default['icecast2']['authentication']['admin-password'] = "d6k31ben"

# default server listen
# TODO : there may be multiple listen-socket elements, this should be an array
default['icecast2']['listen-socket']['port'] = 8000

# default global parameters
default['icecast2']['fileserve'] = 1

# default security parameters
default['icecast2']['security']['changeowner']['user'] = "icecast2"
default['icecast2']['security']['changeowner']['group'] = "icecast"
