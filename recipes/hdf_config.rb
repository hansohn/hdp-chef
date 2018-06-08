#
# Cookbook Name:: hdp-chef
# Recipe:: hdf_config
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe 'ulimit::default'

# set limits
user_ulimit "*" do
  filehandle_soft_limit 50000
  filehandle_hard_limit 50000
  process_soft_limit 10000
  process_hard_limit 10000
end


# widen the port range used for outgoing connections
sysctl 'net.ipv4.ip_local_port_range' do
  name 'net.ipv4.ip_local_port_range'
  value '10000 65000'
  action :apply
end

# wait a maximum of 1 seconds in the TIME_WAIT state after a FIN, to handle
# any remaining packets in the network.
#sysctl_param 'net.netfilter.nf_conntrack_tcp_timeout_time_wait' do
#  value 1
#end

# apply changes
include_recipe 'sysctl::apply'
