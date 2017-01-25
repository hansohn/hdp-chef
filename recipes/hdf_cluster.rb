#
# Cookbook Name:: hdp-chef
# Recipe:: hdf_cluster
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# hdf-cluster: create clusters directory
directory 'make_/var/lib/ambari-clusters' do
  path '/var/lib/ambari-clusters'
  recursive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdf-cluster: add blueprint to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['blueprint_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['blueprint_file']}"
  source "#{node['hw']['hdf']['cluster']['blueprint_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# hdf-cluster: add hostmapping to cluster dir
template "create_/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['hostmapping_file']}" do
  path "/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['hostmapping_file']}"
  source "#{node['hw']['hdf']['cluster']['hostmapping_file']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
end

# set ambari_server var based on Chef Search
# set to hostname for Chef-Zero and Chef-Solo
if Chef::Config[:local_mode]
  ambari_server = node['fqdn']
else
  ambari_server = search(:node, 'role:"ambari_server"')
end

# hdf-cluster: upload blueprint to ambari
bash 'upload_hdf_blueprint' do
  if node['hw']['ambari']['server']['config']['ambari.properties']['api.ssl'] == 'false'
  code "curl -k -X POST \
             -H 'X-Requested-By: ambari' \
             -u admin:admin http://#{ambari_server}:#{node['hw']['ambari']['server']['config']['ambari.properties']['client.api.port']}/api/v1/blueprints/#{node['hw']['hdf']['cluster']['blueprint_name']} \
             -d @#{node['hw']['hdf']['cluster']['blueprint_file']}"
  else
  code "curl -k -X POST \
             -H 'X-Requested-By: ambari' \
             -u admin:admin https://#{ambari_server}:#{node['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.port']}/api/v1/blueprints/#{node['hw']['hdf']['cluster']['blueprint_name']} \
             -d @#{node['hw']['hdf']['cluster']['blueprint_file']}"
  end
  cwd '/var/lib/ambari-clusters'
  only_if { File.exist?("/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['blueprint_file']}") }
end

# hdf-cluster: create hdf cluster
# ISSUE: depending on the order of nodes processed by a Chef server, it is 
#   possible (highly likely) that a race condition can occur where Ambari
#   attempts to build a cluster before required nodes are up. As such, the 
#   below command should be ran manually on large clusters once all dependent 
#   nodes have been verified as ready to be clusterized.
bash 'create_hdf_cluster' do
  if node['hw']['ambari']['server']['config']['ambari.properties']['api.ssl'] == 'false'
  code "curl -k -X POST \
             -H 'X-Requested-By: ambari' \
             -u admin:admin http://#{ambari_server}:#{node['hw']['ambari']['server']['config']['ambari.properties']['client.api.port']}/api/v1/clusters/#{node['hw']['hdf']['cluster']['name']} \
             -d @#{node['hw']['hdf']['cluster']['hostmapping_file']}"
  else
  code "curl -k -X POST \
             -H 'X-Requested-By: ambari' \
             -u admin:admin https://#{ambari_server}:#{node['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.port']}/api/v1/clusters/#{node['hw']['hdf']['cluster']['name']} \
             -d @#{node['hw']['hdf']['cluster']['hostmapping_file']}"
  end
  cwd '/var/lib/ambari-clusters'
  only_if { File.exist?("/var/lib/ambari-clusters/#{node['hw']['hdf']['cluster']['hostmapping_file']}") }
end
