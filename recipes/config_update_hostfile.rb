#
# Cookbook Name:: hdp-chef
# Recipe:: config_update_hostfile
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


hostsfile_entry 'update_hostfile' do
  ip_address node['ipaddress']
  hostname  node['hostname']
  aliases   [node['fqdn']]
  unique    true
  action    :append
end
