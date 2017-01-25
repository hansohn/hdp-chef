#
# Cookbook Name:: hdp-chef
# Recipe:: hdf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install ambari
include_recipe "#{cookbook_name}::ambari_server"

# install blueprint applications
include_recipe "#{cookbook_name}::ambari_infra"
include_recipe "#{cookbook_name}::ambari_metrics"
include_recipe "#{cookbook_name}::logsearch"

# install hortonworks data flow
include_recipe "#{cookbook_name}::repo_hdf"
include_recipe "#{cookbook_name}::hdf_install"
include_recipe "#{cookbook_name}::hdf_config"
include_recipe "#{cookbook_name}::hdf_cluster"
