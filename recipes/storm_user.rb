#
# Cookbook Name:: hdp-chef
# Recipe:: storm_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create storm user
if node['hw']['storm']['user']['name'] != 'root'
  user 'create_storm_user' do
    username    node['hw']['storm']['user']['name']
    home        node['hw']['storm']['user']['home']
    shell       node['hw']['storm']['user']['shell']
    uid         node['hw']['storm']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end
