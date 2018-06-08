#
# Cookbook Name:: hdp-chef
# Recipe:: config_disable_ipv6.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# disable ipv6
sysctl 'net.ipv6.conf.all.disable_ipv6' do
  key 'net.ipv6.conf.all.disable_ipv6'
  value 1
  action :apply
end

sysctl 'net.ipv6.conf.default.disable_ipv6' do
  key 'net.ipv6.conf.default.disable_ipv6'
  value 1
  action :apply
end

sysctl 'net.ipv6.conf.lo.disable_ipv6' do
  key 'net.ipv6.conf.lo.disable_ipv6'
  value 1
  action :apply
end
