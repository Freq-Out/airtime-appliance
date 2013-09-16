# -*- mode: ruby -*-
# vi: set ft=ruby :
# vagrant box add precise64-chef11 http://grahamc.com/vagrant/ubuntu-12.04.2-server-amd64-vmware-fusion.box

Vagrant.configure("2") do |config|
  
  config.vm.hostname = "airtime-vm"
  
  config.vm.network :public_network
  
  config.vm.box = "precise64-chef11"
  config.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04.2-server-amd64-vmware-fusion.box"
  
  config.vm.provider "vmware_fusion" do |vmware|
    vmware.gui = true
  end
  
  config.vm.provider "virtualbox" do |vb, override|
    override.vm.box = "precise32-chef11-vbox"
    override.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04.2-i386-chef-11-omnibus.box"
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