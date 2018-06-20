#
# Cookbook:: hdp-chef
# Recipe:: oozie
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install/configure kafka
include_recipe "#{cookbook_name}::oozie_user"
include_recipe "#{cookbook_name}::oozie_lib"
