#
# Cookbook Name:: hdp-chef
# Recipe:: hadoop_hdfs_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create hdfs user
if node['hw']['hadoop']['hdfs']['user']['name'] != 'root'
  user 'create_hdfs_user' do
    username    node['hw']['hadoop']['hdfs']['user']['name']
    home        node['hw']['hadoop']['hdfs']['user']['home']
    shell       node['hw']['hadoop']['hdfs']['user']['shell']
    uid         node['hw']['hadoop']['hdfs']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end
