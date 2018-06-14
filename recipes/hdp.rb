#
# Cookbook Name:: hdp-chef
# Recipe:: hdp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install ambari
include_recipe 'ambari-chef::ambari_server_prerequisites'
include_recipe 'ambari-chef::ambari_server'

# install blueprint applications
include_recipe "#{cookbook_name}::ambari_infra"
include_recipe "#{cookbook_name}::ambari_metrics"
include_recipe "#{cookbook_name}::hadoop_hdfs"
include_recipe "#{cookbook_name}::hadoop_yarn"
include_recipe "#{cookbook_name}::kafka"
include_recipe "#{cookbook_name}::logsearch"
include_recipe "#{cookbook_name}::oozie"
include_recipe "#{cookbook_name}::zookeeper"

# install hortonworks data platform
include_recipe "#{cookbook_name}::repo_hdp"
include_recipe "#{cookbook_name}::hdp_cluster"
