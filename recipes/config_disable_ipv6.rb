#
# Cookbook Name:: hdp-chef
# Recipe:: config_disable_ipv6.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe 'sysctl::default'

# disable ipv6
sysctl_param 'net.ipv6.conf.all.disable_ipv6' do
  value 1
end

sysctl_param 'net.ipv6.conf.default.disable_ipv6' do
  value 1
end

sysctl_param 'net.ipv6.conf.lo.disable_ipv6' do
  value 1
end

# apply changes
include_recipe 'sysctl::apply'
