# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos-6.4"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"

  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box = "centos-6.4"
    override.vm.box_url = "https://dl.dropbox.com/u/5721940/vagrant-boxes/vagrant-centos-6.4-x86_64-vmware_fusion.box"
  end

  #config.vm.network :private_network, ip: ""

  config.vm.hostname = "centos-6.4"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant"

    chef.json.merge!({
      "mysql" => {
        "server_root_password" => "vagrant"
      }
    })
  end

end
