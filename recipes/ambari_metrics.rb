#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_metrics
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# install/configure ambari metrics
include_recipe "#{cookbook_name}::ambari_metrics_user"
include_recipe "#{cookbook_name}::ambari_metrics_config"
