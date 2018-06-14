#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_infra_config
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# if infra-solr-env infra_solr_ssl_enabled equals https
if node['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_ssl_enabled'] == 'true'
  remote_file "copy_#{node['hw']['ambari']['infra']['crypto']['keystore_jks']}" do
    path node['hw']['ambari']['infra']['crypto']['keystore_jks']
    source "file:///etc/pki/tls/certs/#{node['fqdn']}.jks"
    owner node['hw']['ambari']['infra']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file "copy_#{node['hw']['ambari']['infra']['crypto']['truststore_jks']}" do
    path node['hw']['ambari']['infra']['crypto']['truststore_jks']
    source "file:///etc/pki/tls/private/#{node['fqdn']}.jks"
    owner node['hw']['ambari']['infra']['user']['name']
    group 'root'
    mode 0600
  end
end
