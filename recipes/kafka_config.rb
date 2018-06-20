#
# Cookbook Name:: hdp-chef
# Recipe:: kafka_config
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# create kafka log dir
directory "create_#{node['hw']['kafka']['config']['kafka-broker']['log.dirs']}" do
  path node['hw']['kafka']['config']['kafka-broker']['log.dirs']
  recursive true
  owner node['hw']['kafka']['user']['name']
  group node['hw']['hadoop']['common']['group']['name']
  action :create
end
