# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  #config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  
  # we want latest chef version available
  config.omnibus.chef_version = :latest
    
  # Let's use vagrant-cachier to speed things up
  config.cache.auto_detect = true
  
  # we want an automatic shared & synced folder
  config.vm.synced_folder "shared", "/srv/airtime/stor/shared",
    owner: "root", group: "www-data"

  config.vm.provider "vmware_fusion" do |vmware, override|
    #vmware.gui = true
    # https://github.com/fgrehm/vagrant-cachier/issues/24#issuecomment-20807677
    #override.vm.network :private_network
    override.cache.enable_nfs = true
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
    vmware.vmx["memsize"] = "1024"
    vmware.vmx["numvcpus"] = "2"
  end
  
  config.vm.provider "virtualbox" do |vb, override|
    override.vm.box = "precise-server-cloudimg-64"
    override.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  # This is the default, regular airtime profile
  config.vm.define "airtime", primary: true do |config|
    
    config.vm.hostname = "airtime-vm"
    
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
  
  # This is the undocumented ultrasecret phauneradio profile
  config.vm.define "phauneradio" do |config|
    
    config.vm.hostname = "phauneradio-vm"
    
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
