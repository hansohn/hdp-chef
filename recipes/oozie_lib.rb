#
# Cookbook Name:: hdp-chef
# Recipe:: oozie_lib
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


# create oozie lib dir
directory "create_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie" do
  path "/usr/hdp/#{node['hw']['hdp']['version_full']}"/oozie
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
node['hw']['oozie']['lib'].each do |app|

  # create app directory
  directory "create_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}" do
    path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}"
    owner node['hw']['oozie']['user']['name']
    group node['hw']['hadoop']['common']['group']['name']
    action :create
  end

  # jars - remove undesired jars
  node['hw']['oozie']['lib'][app]['jars_remove'].each do |jar|
    file "delete_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}/#{jar}" do
      path "/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}/#{jar}"
      action :delete
    end
  end

  # jars - download desired jars
  node['hw']['oozie']['lib'][app]['jars_install'].each do |jar|
    node['hw']['oozie']['lib'][app]['jars_install'][jar].each do |name, source, hash|

      # jars - download desired jars
      remote_file "download_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}/#{jar}" do
        source "#{source}"
        checksum "#{checksum}"
        path "install_/usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}/#{name}"
        recursive true
        owner node['hw']['oozie']['user']['name']
        group node['hw']['hadoop']['common']['group']['name']
      end
    end
  end
end
  
# applications - itterate though applications
node['hw']['oozie']['lib'].each do |app|

  # copy jars to hdfs
  bash "copy_oozie_#{app}jars_to_hdfs" do
    code <<-EOF
      hdfs dfs -put /usr/hdp/#{node['hw']['hdp']['version_full']}/oozie/share/lib/#{app}/*.jar /user/oozie/share/lib/lib_*/#{app}/
      hdfs dfs -chown -R #{node['hw']['oozie']['user']['name']}:#{node['hw']['hadoop']['common']['user']['name']}/user/oozie/share/lib/lib_*/#{app}
      hdfs dfs -chmod 644 /user/oozie/share/lib/lib_*/#{app}/*.jar
    EOF
    user node['hw']['hadoop']['common']['user']['name']  
    action :nothing
  end
end
