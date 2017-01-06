#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent_config
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# set ambari-agent file permissions
bash 'set_ambari-agent_file_permissions' do
  code <<-EOF
    chown -R #{node['hw']['ambari']['agent']['user']['name']}:root /etc/ambari-agent
    chown -R #{node['hw']['ambari']['agent']['user']['name']}:root /var/lib/ambari-agent
    chown -R #{node['hw']['ambari']['agent']['user']['name']}:root /var/log/ambari-agent
    chown -R #{node['hw']['ambari']['agent']['user']['name']}:root /var/run/ambari-agent
  EOF
end

# if truststore is enabled
if node['hw']['ambari']['agent']['config']['ssl_truststore_enabled'] == 'true'
  remote_file 'copy_/var/lib/ambari-agent/keys/keystore.jks' do 
    path '/var/lib/ambari-agent/keys/keystore.jks'
    source "file://#{node['hw']['ambari']['agent']['crypto']['truststore_jks']}"
    owner node['hw']['ambari']['agent']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file 'copy_/var/lib/ambari-agent/keys/ca.crt' do 
    path '/var/lib/ambari-agent/keys/ca.crt'
    source "file://#{node['hw']['ambari']['agent']['crypto']['ca']}"
    owner node['hw']['ambari']['agent']['user']['name']
    group 'root'
    mode 0600
  end
end

# if two_way_ssl is enabled
if node['hw']['ambari']['server']['config']['two_way_ssl'] == 'true'
  remote_file 'copy_/var/lib/ambari-agent/keys/https.crt' do 
    path "/var/lib/ambari-agent/keys/#{node['fqdn']}.crt"
    source "file://#{node['hw']['ambari']['agent']['crypto']['cert']}"
    owner node['hw']['ambari']['agent']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file 'copy_/var/lib/ambari-agent/keys/https.key' do 
    path "/var/lib/ambari-agent/keys/#{node['fqdn']}.key"
    source "file://#{node['hw']['ambari']['agent']['crypto']['key']}"
    owner node['hw']['ambari']['agent']['user']['name']
    group 'root'
    mode 0600
  end
end

# set ambari_server var based on Chef Search
# set to localhost for Chef-Zero and Chef-Solo
if Chef::Config[:local_mode]
  ambari_server = node['fqdn']
else
  ambari_server = search(:node, 'role:"ambari_server"')
end

# update ambari with new config
template 'create_/etc/ambari-agent/conf/ambari-agent.ini' do
  path '/etc/ambari-agent/conf/ambari-agent.ini'
  source "ambari-agent.ini_#{node['hw']['hdp']['version']}.erb"
  owner node['hw']['ambari']['agent']['user']['name']
  group 'root'
  variables( :ambari_server => ambari_server )
end
