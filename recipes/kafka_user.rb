#
# Cookbook Name:: hdp-chef
# Recipe:: kafka_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create kafka user
if node['hw']['kafka']['user']['name'] != 'root'
  user 'create_kafka_user' do
    username    node['hw']['kafka']['user']['name']
    home        node['hw']['kafka']['user']['home']
    shell       node['hw']['kafka']['user']['shell']
    uid         node['hw']['kafka']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end
