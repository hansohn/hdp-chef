#
# Cookbook Name:: hdp-chef
# Recipe:: hdp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install hdp repo
include_recipe "#{cookbook_name}::repo_hdp"

# config hdp applications
include_recipe "#{cookbook_name}::hadoop_hdfs"
include_recipe "#{cookbook_name}::hadoop_yarn"
include_recipe "#{cookbook_name}::kafka"
include_recipe "#{cookbook_name}::oozie"
include_recipe "#{cookbook_name}::zookeeper"

# add hdp cluster files
include_recipe "#{cookbook_name}::hdp_cluster"
