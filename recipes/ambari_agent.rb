#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install prerequsites
#include_recipe "#{cookbook_name}::java"
include_recipe "#{cookbook_name}::disable_ipv6"

# install hdp
include_recipe "#{cookbook_name}::hw_repo"
include_recipe "#{cookbook_name}::ambari_agent_install"
include_recipe "#{cookbook_name}::ambari_agent_user"
include_recipe "#{cookbook_name}::ambari_agent_config"
include_recipe "#{cookbook_name}::ambari_agent_service"
