#
# Cookbook Name:: hdp-chef
# Recipe:: hdf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install prerequsites
include_recipe "#{cookbook_name}::ambari_server"

# install ambari-server
include_recipe "#{cookbook_name}::repo_hdf"
include_recipe "#{cookbook_name}::hdf_install"
