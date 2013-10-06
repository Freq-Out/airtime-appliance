# Airtime-Chef Deployment

This is an example of an Airtime Chef automated deployment, that we use internally for easily testing new releases and features. 

This is **NOT** meant for production use.

It uses Opscode Chef (solo) 11.8 and Librarian-Chef.

Software includes apache2, php5, icecast2, postgresql, airtime.

## Prerequisites

* [Virtualbox](https://www.virtualbox.org/) or VMware Fusion
* [Vagrant](http://downloads.vagrantup.com/) and a Ubuntu Box
* a working ruby dev environment: try [homebrew](http://brew.sh) for a good start

## Install

Install vagrant-omnibus:

````
$ vagrant plugin install vagrant-omnibus
````

Then launch bundler: 

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

## Web Access

Access your new Airtime installation: 

* Airtime web GUI: [http://localhost:8080](http://localhost:8080)
* Icecast stream: [http://localhost:8000/airtime_128](http://localhost:8000/airtime_128)

## SSH Access

If needed, you can access the box by SSH.

````
$ vagrant ssh
````

## Optional Configuration Steps

### Timezone

Airtime timezone is optionnaly to be configured

### Icecast2 

Enter valid credentials into Airtime if needed

## Chef Roles dependencies

(updated by issuing `knife role spaghetti`)

![Airtime Chef Roles Dependencies Graph][1]
[1]: ./role-spaghetti.png "Airtime Chef Roles Dependencies Graph"

