#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install prerequsites
#include_recipe "#{cookbook_name}::java"
include_recipe "#{cookbook_name}::config_disable_ipv6"
include_recipe "#{cookbook_name}::postgres_install"

# install ambari-server
include_recipe "#{cookbook_name}::repo_ambari"
include_recipe "#{cookbook_name}::ambari_server_install"
include_recipe "#{cookbook_name}::ambari_server_user"
include_recipe "#{cookbook_name}::ambari_server_config"
include_recipe "#{cookbook_name}::ambari_server_service"
include_recipe "#{cookbook_name}::ambari_agent_install"
include_recipe "#{cookbook_name}::ambari_agent_user"
include_recipe "#{cookbook_name}::ambari_agent_config"
include_recipe "#{cookbook_name}::ambari_agent_service"
