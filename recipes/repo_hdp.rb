#
# Cookbook Name:: hdp-chef
# Recipe:: repo_hdp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# reload internal Chef yum cache
ruby_block 'yum_cache_reload' do
  block { Chef::Provider::Package::Yum::YumCache.instance.reload }
  action :nothing
end

# add hdp yum repo
remote_file 'hdp_yum_repo' do
  source node['hw']['hdp']['repo']
  path "/etc/yum.repos.d/hdp_#{node['hw']['hdp']['version']}.repo"
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
  notifies :run, 'ruby_block[yum_cache_reload]', :immediately
end
