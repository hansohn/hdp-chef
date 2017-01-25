#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe 'java'

# include package(s)
package [ 'openssl-devel', 'python' ]

# install ambari-server
package 'ambari-agent' do
  package_name 'ambari-agent'
  version node['hw']['ambari']['version_full']
  action :install
  not_if do ::File.exists?('/etc/rc.d/init.d/ambari-agent') end
end
