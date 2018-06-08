#
# Cookbook Name:: hdp-chef
# Recipe:: oozie_lib
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create oozie lib dir
directory "create_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie" do
  path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie"
  recursive true
  action :create
end

directory "create_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib" do
  path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib"
  recursive true
  owner node['hw']['oozie']['user']['name']
  group node['hw']['hadoop']['common']['group']['name']
  action :create
end

# applications - itterate though applications
node['hw']['oozie']['lib'].each do |app_name,app|

  # create app directory
  directory "create_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}" do
    path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}"
    owner node['hw']['oozie']['user']['name']
    group node['hw']['hadoop']['common']['group']['name']
    action :create
  end

  # jars - remove undesired jars
  node['hw']['oozie']['lib'][app_name]['jars_remove'].each do |jar_name|
    file "delete_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}/#{jar_name}" do
      path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}/#{jar_name}"
      action :delete
    end
  end

  # jars - download desired jars
  node['hw']['oozie']['lib'][app_name]['jars_install'].each do |jar_name,jar|
    # jars - download desired jars
    remote_file "download_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}/#{jar['name']}" do
      source "#{jar['source']}"
      checksum "#{jar['checksum']}"
      path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}/#{jar['name']}"
      owner node['hw']['oozie']['user']['name']
      group node['hw']['hadoop']['common']['group']['name']
    end
  end
end
  
# applications - itterate though applications
node['hw']['oozie']['lib'].each do |app_name,app|

  # copy jars to hdfs
  bash "copy_oozie_#{app_name}jars_to_hdfs" do
    code <<-EOF
      hdfs dfs -put /usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app_name}/*.jar /user/oozie/share/lib/lib_*/#{app_name}/
      hdfs dfs -chown -R #{node['hw']['oozie']['user']['name']}:#{node['hw']['hadoop']['common']['group']['name']} /user/oozie/share/lib/lib_*/#{app_name}
      hdfs dfs -chmod 644 /user/oozie/share/lib/lib_*/#{app_name}/*.jar
    EOF
    user node['hw']['hadoop']['hdfs']['user']['name']  
    action :nothing
  end
end
