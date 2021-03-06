# -*- mode: ruby -*-
# vi: set ft=ruby :

required_vagrant_version = '1.2.0'
if Vagrant::VERSION < required_vagrant_version
  puts <<-EOF
You need at least version #{required_vagrant_version} of Vagrant to use this
project. Get it at http://downloads.vagrantup.com
  EOF

  exit 1
end

Vagrant.configure("2") do |config|
  
  #config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 4443
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  
  # we want latest chef version available
  config.omnibus.chef_version = :latest
  
  # enable berkshelf integration
  config.berkshelf.enabled = true
  
  # 
  config.vm.box = "chef/ubuntu-12.04"
  
  # Let's use vagrant-cachier to speed things up
  # if Vagrant.has_plugin?("vagrant-cachier")
  #   config.cache.scope = :box
  #   config.cache.synced_folder_opts = { 
  #     type: :nfs 
  #   }
  # end
  
  # we want an automatic shared & synced folder
  config.vm.synced_folder "shared", "/srv/airtime/stor/shared",
    owner: "root", group: "www-data"

  config.vm.provider "vmware_fusion" do |vmware, override|
    vmware.vmx["memsize"] = "1024"
    vmware.vmx["numvcpus"] = "2"
  end
  
  config.vm.provider "virtualbox" do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  # This is the default, regular airtime profile
  config.vm.define "airtime", primary: true do |config|
    
    config.vm.hostname = "airtime-vm"
    
    config.vm.provision :shell, :inline => "apt-get update"
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
      chef.custom_config_path = "Vagrantfile.chef"
      chef.json = {
        'postgresql' => {
          'password' => {
            'postgres' => 'uberpassword'
          }
        }
      }
    end
  end
  
  # This is the undocumented ultrasecret phauneradio profile
  config.vm.define "phauneradio" do |config|
    
    config.vm.hostname = "phauneradio-vm"
    
    config.vm.provision :shell, :inline => "apt-get update"
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
      chef.add_recipe 'phauneradio'
      chef.json = {
        'postgresql' => {
          'password' => {
            'postgres' => 'uberpassword'
          }
        }
      }
    end
  end
  
end
