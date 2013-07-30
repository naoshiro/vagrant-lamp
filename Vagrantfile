# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos-6.4"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
  config.vm.network :private_network, ip: "192.168.56.101"

  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box = "centos-6.4"
    override.vm.box_url = "https://dl.dropbox.com/u/5721940/vagrant-boxes/vagrant-centos-6.4-x86_64-vmware_fusion.box"
    override.vm.network :private_network, ip: "172.16.200.201"
  end

  #config.vm.network :private_network, ip: ""

  config.vm.hostname = "centos-6.4"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"

    chef.json = {
      "mysql" => {
        "server_root_password" => "vagrant",
        "server_debian_password" => "vagrant",
        "server_repl_password" => "vagrant"
      }
    }

    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "apache2::mod_ssl"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "php"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "iptables"
    chef.add_recipe "vagrant"

    # chef.json.merge!({
    #   "mysql" => {
    #     "server_root_password" => "vagrant"
    #   }
    # })
  end

end
