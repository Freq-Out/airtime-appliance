# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.hostname = "airtime-vm"
  
  config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.box = "precise64"
  
  # we want latest chef version available
  config.omnibus.chef_version = :latest
  config.vm.provider "vmware_fusion" do |vmware|
    #vmware.gui = true
    #vmware.box = "precise64"
  end
  
  config.vm.provider "virtualbox" do |vb, override|
    #override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.data_bags_path = "data_bags"
    chef.roles_path = "roles"
    chef.add_role 'base'
    chef.add_role 'web'
    chef.add_role 'db'
    chef.add_role 'icecast'
    chef.add_role 'rabbitmq'
    chef.add_role 'airtime'
    chef.json = {
      'postgresql' => {
        'password' => {
          'postgres' => 'uberpassword'
        }
      }
    }
  end
end

#node['postgresql']['password']['postgres']