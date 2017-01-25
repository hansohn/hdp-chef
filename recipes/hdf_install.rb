#
# Cookbook Name:: hdp-chef
# Recipe:: hdf_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# download hdf management pack
remote_file 'download_hdf_mgmt_pack' do
  path "/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz"
  source node['hw']['hdf']['mgmt_pack']['url']
  checksum node['hw']['hdf']['mgmt_pack']['checksum']
end

# backup ambari resources
bash 'backup_ambari_resources' do
  code 'cp -r /var/lib/ambari-server/resources /var/lib/ambari-server/resources.backup'
  action :nothing
  only_if { File.exist?('/var/lib/ambari-server/resources') }
end

# set ambari-server file permissions
bash 'set_ambari-server_file_permissions' do
  code "chown -R #{node['hw']['ambari']['server']['user']['name']}:root /var/lib/ambari-server"
  action :nothing
end

# restart ambari server
service 'ambari-server_service' do
  service_name 'ambari-server.service'
  status_command "grep -q 'Ambari Server running' <(/etc/init.d/ambari-server status)"
  action :nothing
end

# verify ambari server is up and responding
bash 'verify_ambari_server_is_responding' do
  code <<-EOF
    i=1
    while ! grep -q 8080 <(netstat -anop) && [ $i -lt 12 ]; do
      i=$((i+1))
      sleep 5
    done
  EOF
  action :nothing
end

# install hdf managemnet pack
bash 'install_hdf_mgmt_pack' do
  code "ambari-server install-mpack \
          --mpack=/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz \
          --purge \
          --verbose"
  only_if { File.exist?("/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz") }
  not_if  { Dir["/var/lib/ambari-server/resources/mpacks/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.*"].any? }
  notifies :run, 'bash[backup_ambari_resources]', :before 
  notifies :run, 'bash[set_ambari-server_file_permissions]', :immediately 
  notifies :restart, 'service[ambari-server_service]', :immediately 
  notifies :run, 'bash[verify_ambari_server_is_responding]', :immediately 
end
