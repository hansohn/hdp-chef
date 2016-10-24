#
# Cookbook Name:: hdp-chef
# Recipe:: hdp_repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# reload internal Chef yum cache
ruby_block 'yum_cache_reload' do
  block { Chef::Provider::Package::Yum::YumCache.instance.reload }
  action :nothing
end

# add ambari yum repo
remote_file 'ambari_yum_repo' do
  source node['hdp']['repo']['ambari']
  path "/etc/yum.repos.d/ambari_#{node['hdp']['version']}.repo"
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
  notifies :run, 'ruby_block[yum_cache_reload]', :immediately
end

# add hdp yum repo
remote_file 'hdp_yum_repo' do
  source node['hdp']['repo']['hdp']
  path "/etc/yum.repos.d/hdp_#{node['hdp']['version']}.repo"
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
  notifies :run, 'ruby_block[yum_cache_reload]', :immediately
end
