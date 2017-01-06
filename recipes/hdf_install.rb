#
# Cookbook Name:: hdp-chef
# Recipe:: hdf_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# backup ambari resources
bash 'backup_ambari_resources' do
  code 'cp -r /var/lib/ambari-server/resources /var/lib/ambari-server/resources.backup'
  only_if { File.exist?('/var/lib/ambari-server/resources') }
end

# download hdf management pack
remote_file 'download_hdf_mgmt_pack' do
  path "/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz"
  source node['hw']['hdf']['mgmt_pack']['url']
  checksum node['hw']['hdf']['mgmt_pack']['checksum']
  action :create
end

# install hdf managemnet pack
bash 'install_hdf_mgmt_pack' do
  code "ambari-server install-mpack \
          --mpack=/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz \
          --purge \
          --verbose"
  only_if { File.exist?("/tmp/hdf-ambari-mpack-#{node['hw']['hdf']['version']}.tar.gz") }
end

# set ambari-server file permissions
bash 'set_ambari-server_file_permissions' do
  code "chown -R #{node['hw']['ambari']['server']['user']['name']}:root /var/lib/ambari-server"
end

# restart ambari-server service
service 'restart_ambari_server' do
  service_name 'ambari-server'
  action :restart
end
