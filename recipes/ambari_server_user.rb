#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create ambari-server user
if node['hw']['ambari']['server']['user']['name'] != 'root'
  user 'create_ambari_server_user' do
    username    node['hw']['ambari']['server']['user']['name']
    uid         node['hw']['ambari']['server']['user']['uid']
    home        node['hw']['ambari']['server']['user']['home']
    shell       node['hw']['ambari']['server']['user']['shell']
    group       node['hw']['hadoop']['common']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end

# add ambari-server sudoers file
if node['hw']['ambari']['server']['user']['name'] != 'root'
  template "create_/etc/sudoers.d/ambari-server" do
    path "/etc/sudoers.d/ambari-server"
    source "ambari-server.sudoers.erb"
    owner 'root'
    group 'root'
  end
end

