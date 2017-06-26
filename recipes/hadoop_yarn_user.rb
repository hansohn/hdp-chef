#
# Cookbook Name:: hdp-chef
# Recipe:: hadoop_yarn_user
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create yarn user
if node['hw']['yarn']['user']['name'] != 'root'
  user 'create_yarn_user' do
    username    node['hw']['yarn']['user']['name']
    home        node['hw']['yarn']['user']['home']
    shell       node['hw']['yarn']['user']['shell']
    uid         node['hw']['yarn']['user']['uid']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end
