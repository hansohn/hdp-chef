#
# Cookbook Name:: hdp-chef
# Recipe:: zookeeper_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create zookeeper user
if node['hw']['zookeeper']['user']['name'] != 'root'
  user 'create_zookeeper_user' do
    username    node['hw']['zookeeper']['user']['name']
    home        node['hw']['zookeeper']['user']['home']
    shell       node['hw']['zookeeper']['user']['shell']
    uid         node['hw']['zookeeper']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end
