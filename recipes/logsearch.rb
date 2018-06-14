#
# Cookbook Name:: hdp-chef
# Recipe:: logsearch
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# install/configure logsearch
include_recipe "#{cookbook_name}::logsearch_user"
include_recipe "#{cookbook_name}::logsearch_config"
