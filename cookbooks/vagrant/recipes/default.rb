#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe "build-essential"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

%w{ vim curl wget }.each do |a_package|
    package a_package
end

apache_site "default" do
    enable false
end

web_app "vagrant" do
    template "default-site.conf.erb"
    docroot "/vagrant/public"
    server_name node[:fqdn]
    server_aliases [node[:hostname]]
end
