#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_metrics_config
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# if ams-grafana-ini protocol equals https
if node['hw']['ambari']['metrics']['config']['ams-grafana-ini']['protocol'] == 'https'
  remote_file "copy_#{node['hw']['ambari']['metrics']['crypto']['cert']}" do
    path node['hw']['ambari']['metrics']['crypto']['cert']
    source "file:///etc/pki/tls/certs/#{node['fqdn']}.crt"
    owner node['hw']['ambari']['metrics']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file "copy_#{node['hw']['ambari']['metrics']['crypto']['key']}" do
    path node['hw']['ambari']['metrics']['crypto']['key']
    source "file:///etc/pki/tls/private/#{node['fqdn']}.key"
    owner node['hw']['ambari']['metrics']['user']['name']
    group 'root'
    mode 0600
  end
end
