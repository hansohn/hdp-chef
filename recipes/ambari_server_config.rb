#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_config
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# set ambari-server file permissions
bash 'set_ambari-server_file_permissions' do
  code <<-EOF
    chown -R #{node['hdp']['ambari-server']['user']['name']}:root /etc/ambari-server
    chown -R #{node['hdp']['ambari-server']['user']['name']}:root /var/lib/ambari-server
    chown -R #{node['hdp']['ambari-server']['user']['name']}:root /var/log/ambari-server
    chown -R #{node['hdp']['ambari-server']['user']['name']}:root /var/run/ambari-server
  EOF
end

# if truststore is enabled
if node['hdp']['ambari-server']['config']['ssl_truststore_enabled'] == 'true'
  remote_file 'copy_/var/lib/ambari-server/keys/keystore.jks' do 
    path '/var/lib/ambari-server/keys/keystore.jks'
    source "file://#{node['hdp']['ambari-server']['crypto']['truststore_jks']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
  file 'create_/var/lib/ambari-server/keys/pass.txt' do
    path '/var/lib/ambari-server/keys/pass.txt'
    content "#{node['hdp']['ambari-server']['crypto']['truststore_pass']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode '0600'
  end
  remote_file 'copy_/var/lib/ambari-server/keys/ca.crt' do 
    path '/var/lib/ambari-server/keys/ca.crt'
    source "file://#{node['hdp']['ambari-server']['crypto']['ca_cert']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
end

# if https is enabled
if node['hdp']['ambari-server']['config']['api_ssl'] == 'true'
  remote_file 'copy_/var/lib/ambari-server/keys/https.crt' do 
    path '/var/lib/ambari-server/keys/https.crt'
    source "file://#{node['hdp']['ambari-server']['crypto']['https_cert']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
  remote_file 'copy_/var/lib/ambari-server/keys/https.key' do 
    path '/var/lib/ambari-server/keys/https.key'
    source "file://#{node['hdp']['ambari-server']['crypto']['https_key']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
  file 'create_/var/lib/ambari-server/keys/http.pass.txt' do
    path '/var/lib/ambari-server/keys/http.pass.txt'
    content "#{node['hdp']['ambari-server']['crypto']['http_key_pass']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode '0600'
  end
  remote_file 'copy_/var/lib/ambari-server/keys/https.keystore.p12' do 
    path '/var/lib/ambari-server/keys/https.keystore.p12'
    source "file://#{node['hdp']['ambari-server']['crypto']['https_keystore_p12']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
end

# if ldap is enabled
if node['hdp']['ambari-server']['config']['ldap_is_configured'] == 'true'
  remote_file 'copy_/var/lib/ambari-server/keys/https.keystore.jks' do 
    path '/var/lib/ambari-server/keys/https.keystore.jks'
    source "file://#{node['hdp']['ambari-server']['crypto']['https_keystore_jks']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode 0600
  end
  file 'create_/var/lib/ambari-server/keys/http.pass.txt' do
    path '/var/lib/ambari-server/keys/http.pass.txt'
    content "#{node['hdp']['ambari-server']['crypto']['http_key_pass']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode '0600'
  end
  file 'create_/etc/ambari-server/conf/ldap-password.dat' do
    path '/etc/ambari-server/conf/ldap-password.dat'
    content "#{node['hdp']['ambari-server']['crypto']['ldap_pass']}"
    owner node['hdp']['ambari-server']['user']['name']
    group 'root'
    mode '0600'
  end
end

# update amabri with new config
template 'create_/etc/ambari-server/conf/ambari.properties' do
  path '/etc/ambari-server/conf/ambari.properties'
  source "ambari.properties_#{node['hdp']['version']}.erb"
  owner node['hdp']['ambari-server']['user']['name']
  group 'root'
end
