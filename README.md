# Airtime-Chef Deployment

This is an example of an Airtime Chef automated deployment, that we use internally for easily testing new releases and features. 

This is **NOT** meant for production use.

It uses Opscode Chef (solo) 11.8 and Librarian-Chef.

Software includes apache2, php5, icecast2, postgresql, airtime.

## Prerequisites

* [Virtualbox](https://www.virtualbox.org/) or VMware Fusion
* [Vagrant](http://downloads.vagrantup.com/)
* a working ruby dev environment: try [homebrew](http://brew.sh) for a good start

## Install

````
$ bundle install --binstubs
$ ./bin/librarian-chef install
````


## Launch 

* VMware Fusion

````
$ vagrant up --provider=vmware_fusion
````

* VirtualBox

````
$ vagrant up --provider=virtualbox
````

## Connect

````
$ vagrant ssh
````

## Optional Configuration Steps

### Timezone

Airtime timezone is optionnaly to be configured

### Icecast2 

Enter valid credentials into Airtime if needed

