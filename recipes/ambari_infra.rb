#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_infra
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# install/configure ambari infra
include_recipe "#{cookbook_name}::ambari_infra_user"
include_recipe "#{cookbook_name}::ambari_infra_config"
