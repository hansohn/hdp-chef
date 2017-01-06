#
# Cookbook Name:: hdp-chef
# Recipe:: logsearch_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create ambari-logsearch user
if node['hw']['logsearch']['user']['name'] != 'root'
  user 'create_ambari_logsearch_user' do
    username    node['hw']['logsearch']['user']['name']
    home        node['hw']['logsearch']['user']['home']
    shell       node['hw']['logsearch']['user']['shell']
    uid         node['hw']['logsearch']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end
