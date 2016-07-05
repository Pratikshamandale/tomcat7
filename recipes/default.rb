#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright 2016, OPEX SOFTWARE
#
# All rights reserved - Do Not Redistribute



execute 'apt-get update' do
  command "sudo apt-get update"
  action :run
end


#install the 'Development tools' package group
%w[build-essential libpcre3 libpcre3-dev openssl libssl-dev unzip].each do |pkg|
  package pkg do
    action :install
  end
end

#install tomcat7
package 'tomcat7' do
  action :install
end



cookbook_file "/etc/default/tomcat7" do
  source "tomcat7"
  owner "root"
  group "root"
  mode  "0644"
  action :create
end



service 'tomcat7' do
  action:restart
end
