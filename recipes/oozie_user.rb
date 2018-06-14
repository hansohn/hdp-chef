#
# Cookbook Name:: hdp-chef
# Recipe:: oozie_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create oozie user
if node['hw']['oozie']['user']['name'] != 'root'
  user 'create_oozie_user' do
    username    node['hw']['oozie']['user']['name']
    home        node['hw']['oozie']['user']['home']
    shell       node['hw']['oozie']['user']['shell']
    uid         node['hw']['oozie']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end
