#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hdp']['hadoop']['group']['name']
  gid         node['hdp']['hadoop']['group']['gid']
  action      :create
end

# create ambari-agent user
if node['hdp']['ambari-agent']['user']['name'] != 'root'
  user 'create_ambari_user' do
    username    node['hdp']['ambari-agent']['user']['name']
    uid         node['hdp']['ambari-agent']['user']['uid']
    home        node['hdp']['ambari-agent']['user']['home']
    shell       node['hdp']['ambari-agent']['user']['shell']
    group       node['hdp']['hadoop']['group']['name']
    supports    :manage_home => true
    action      :create
  end
end

# add ambari-agent sudoers file
if node['hdp']['ambari-agent']['user']['name'] != 'root'
  template "create_/etc/sudoers.d/ambari-agent" do
    path "/etc/sudoers.d/ambari-agent"
    source "ambari-agent.sudoers.erb"
    owner 'root'
    group 'root'
  end
end
