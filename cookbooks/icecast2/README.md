Description
===========

Installs icecast2 server package.

Requirements
============

Platform
--------

Tested on Debian 6, but should work on recent Debian or Ubuntu servers.
Not tested on RedHat based distributions.

Attributes
==========

All attributes have a decent default value set in the default.rb attributes file.

## Initscript default file parameters (/etc/default/icecast2)

Userid and groupid (name or ID) the daemon should *start* under.
You may override it to root/root if you need to bind a <1024 port, then set
`node['icecast2']['security']['changeowner']['user']` and
`node['icecast2']['security']['changeowner']['group']`
to something like icecast2/icecast, so the icecast daemon drops privileges right after.

* `node['icecast2']['userid']` - userid (name or ID) the daemon should *start* under.
* `node['icecast2']['groupid']` - groupid (name or ID) the daemon should *start* under.

## Main icecast2 config file parameters (/etc/icecast2/icecast.xml)

### Limits

* `node['icecast2']['limits']['clients']` - Total number of concurrent clients supported.
* `node['icecast2']['limits']['sources']` - Maximum number of connected sources supported.
* `node['icecast2']['limits']['threadpool']` - Number of threads that are started to
  handle client connections
* `node['icecast2']['limits']['source-timeout']` - If a connected source does not send any
  data within this timeout period (in seconds), then the source connection will be removed
  from the server

### Server authentication

* `node['icecast2']['authentication']['source-password']` - The unencrypted password used
  by sources to connect to icecast2.
* `node['icecast2']['authentication']['relay-password']` - Used in the master server as
  part of the authentication when a slave requests the list of streams to relay. 
* `node['icecast2']['authentication']['admin-user']` - The username used for all
  administration functions.
* `node['icecast2']['authentication']['admin-password']` - The password used for all
  administration functions.

### Server listen

TODO : there may be multiple listen-socket elements, this should be an array

* `node['icecast2']['listen-socket']['port']` - The TCP port that will be used to accept
 client connections.

### Global parameters

* `node['icecast2']['fileserve']` - This flag turns on the icecast2 fileserver from which
  static files can be served.

### Security parameters

* `node['icecast2']['security']['changeowner']['user']` - User that will own the icecast
  process after it is started. 
* `node['icecast2']['security']['changeowner']['group']` - Group that will own the icecast
  process after it is started. 

Recipes
=======

This cookbook provides only the default recipe.
It installs the native distribution package through the package manager and sets up the
configuration.

Usage
=====

Include the recipe on your node or role.
Modify the attributes as required in your role to change how various configuration is
applied per the attributes section above. In general, override attributes in the role
should be used when changing attributes.

License and Author
==================

- Author:: Ronnie Garcia (<community@ovea.com>)
- Copyright:: 2013, OVEA

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


