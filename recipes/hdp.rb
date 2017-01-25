#
# Cookbook Name:: hdp-chef
# Recipe:: hdp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install ambari
include_recipe "#{cookbook_name}::ambari_server"

# install blueprint applications
include_recipe "#{cookbook_name}::ambari_infra"
include_recipe "#{cookbook_name}::ambari_metrics"
include_recipe "#{cookbook_name}::logsearch"

# install hortonworks data platform
include_recipe "#{cookbook_name}::repo_hdp"
include_recipe "#{cookbook_name}::hdp_cluster"
