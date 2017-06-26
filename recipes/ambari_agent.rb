#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install prerequsites
include_recipe "java-chef::default"
#include_recipe "#{cookbook_name}::java"
#include_recipe "#{cookbook_name}::config_disable_ipv6"

# install ambari-agent
include_recipe "#{cookbook_name}::repo_ambari"
include_recipe "#{cookbook_name}::ambari_agent_install"
include_recipe "#{cookbook_name}::ambari_agent_user"
include_recipe "#{cookbook_name}::ambari_agent_config"
include_recipe "#{cookbook_name}::ambari_agent_service"
