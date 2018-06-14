#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_metrics_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create ambari-metrics user
if node['hw']['ambari']['metrics']['user']['name'] != 'root'
  user 'create_ambari_metrics_user' do
    username    node['hw']['ambari']['metrics']['user']['name']
    home        node['hw']['ambari']['metrics']['user']['home']
    shell       node['hw']['ambari']['metrics']['user']['shell']
    uid         node['hw']['ambari']['metrics']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end
