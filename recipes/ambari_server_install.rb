#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe 'java'

# include package(s)
package [ 'openssl-devel', 'postgresql', 'python' ]

# setup ambari-server
bash 'config_ambari_server' do
  code 'ambari-server setup -s'
  user 'root'
  group 'root'
  action 'nothing'
end

# install amabri-server
package 'ambari-server' do
  package_name 'ambari-server'
  action :install
  notifies :run, 'bash[config_ambari_server]', :immediately
  not_if do ::File.exists?('/etc/rc.d/init.d/ambari-server') end
end

# start/enable postgresql
service 'postgresql' do
  action [:start, :enable]
end
