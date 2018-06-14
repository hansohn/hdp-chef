#
# Cookbook Name:: hdp-chef
# Recipe:: kafka
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# install/configure kafka
include_recipe "#{cookbook_name}::kafka_user"
include_recipe "#{cookbook_name}::kafka_config"
