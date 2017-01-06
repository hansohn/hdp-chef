#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_infra_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create ambari-infra user
if node['hw']['ambari']['infra']['user']['name'] != 'root'
  user 'create_ambari_infra_user' do
    username    node['hw']['ambari']['infra']['user']['name']
    home        node['hw']['ambari']['infra']['user']['home']
    shell       node['hw']['ambari']['infra']['user']['shell']
    uid         node['hw']['ambari']['infra']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end
