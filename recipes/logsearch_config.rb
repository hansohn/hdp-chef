#
# Cookbook Name:: hdp-chef
# Recipe:: logsearch_config
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# if logsearch-env logsearch_ui_protocol equals https
if node['hw']['logsearch']['config']['logsearch-env']['logsearch_ui_protocol'] == 'https'
  remote_file "copy_#{node['hw']['logsearch']['crypto']['keystore_jks']}" do
    path node['hw']['logsearch']['crypto']['keystore_jks']
    source "file:///etc/pki/tls/certs/#{node['fqdn']}.jks"
    owner node['hw']['logsearch']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file "copy_#{node['hw']['logsearch']['crypto']['truststore_jks']}" do
    path node['hw']['logsearch']['crypto']['truststore_jks']
    source "file:///etc/pki/tls/private/#{node['fqdn']}.jks"
    owner node['hw']['logsearch']['user']['name']
    group 'root'
    mode 0600
  end
end
