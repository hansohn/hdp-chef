#
# Cookbook Name:: hdp-chef
# Recipe:: hdp_cluster
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# hdp-cluster: create clusters directory
directory 'make_/var/lib/ambari-clusters' do
  path '/var/lib/ambari-clusters'
  recursive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdp-cluster: add blueprint to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['cluster']['blueprint_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['cluster']['blueprint_file']}"
  source "#{node['hw']['cluster']['blueprint_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdp-cluster: add hostmapping to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['cluster']['hostmapping_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['cluster']['hostmapping_file']}"
  source "#{node['hw']['cluster']['hostmapping_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end
