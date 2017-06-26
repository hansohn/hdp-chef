#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hw']['hadoop']['common']['group']['name']
  gid         node['hw']['hadoop']['common']['group']['gid']
  action      :create
end

# create ambari-agent user
if node['hw']['ambari']['agent']['user']['name'] != 'root'
  user 'create_ambari_agent_user' do
    username    node['hw']['ambari']['agent']['user']['name']
    uid         node['hw']['ambari']['agent']['user']['uid']
    home        node['hw']['ambari']['agent']['user']['home']
    shell       node['hw']['ambari']['agent']['user']['shell']
    group       node['hw']['hadoop']['common']['group']['name']
    manage_home true
    action      :create
  end
end

# add ambari-agent sudoers file
if node['hw']['ambari']['agent']['user']['name'] != 'root'
  template "create_/etc/sudoers.d/ambari-agent" do
    path "/etc/sudoers.d/ambari-agent"
    source "ambari-agent.sudoers.erb"
    sensitive true
    owner 'root'
    group 'root'
  end
end
