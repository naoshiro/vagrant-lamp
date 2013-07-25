# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"

  config.vm.hostname = ""

  config.vm.network :private_network, ip: ""

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
