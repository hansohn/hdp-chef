#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# include recipe(s)
include_recipe 'java'

# include package(s)
package [ 'openssl-devel', 'postgresql', 'python' ]

# create postgres database
# create /tmp/postgres_create_ambari_db.sql
template 'create_/tmp/postgres_create_ambari_db.sql' do
  path '/tmp/postgres_create_ambari_db.sql'
  source 'postgres_create_ambari_db.sql.erb'
  sensitive true
  owner 'postgres'
  group 'postgres'
  mode '0600'
  action :nothing
end

# create postgres_create_ambari_db
bash 'create_ambari_postgres_db' do
  code "psql -f '/tmp/postgres_create_ambari_db.sql'"
  user 'postgres'
  action :nothing
  only_if { File.exist?('/tmp/postgres_create_ambari_db.sql') }
end

# populate postgres database
# create /tmp/postgres_create_ambari_schema.sql
template 'create_/tmp/postgres_create_ambari_schema.sql' do
  path '/tmp/postgres_create_ambari_schema.sql'
  source 'postgres_create_ambari_schema.sql.erb'
  sensitive true
  owner 'postgres'
  group 'postgres'
  mode '0600'
  action :nothing
end

# create postgres_create_ambari_schema
bash 'create_ambari_postgres_schema' do
  code <<-EOF
    export PGPASSWORD='#{node['hw']['ambari']['server']['setup']['db']['databasepassword']}'
    psql -U #{node['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.name']} \
         -d #{node['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database_name']} \
         -f '/tmp/postgres_create_ambari_schema.sql'
  EOF
  user 'postgres'
  action :nothing
  only_if { File.exist?('/tmp/postgres_create_ambari_schema.sql') }
end

# install & configure ambari-server
# setup ambari-server
bash 'config_ambari_server' do
  code "ambari-server setup -s \
        --database=#{node['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database']} \
        --databasehost=#{node['hw']['ambari']['server']['setup']['db']['databasehost']} \
        --databaseport=#{node['hw']['ambari']['server']['setup']['db']['databaseport']} \
        --databasename=#{node['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database_name']} \
        --databaseusername=#{node['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.name']} \
        --databasepassword=#{node['hw']['ambari']['server']['setup']['db']['databasepassword']}"
  user 'root'
  group 'root'
  action 'nothing'
end

# install ambari-server
package 'ambari-server' do
  package_name 'ambari-server'
  version node['hw']['ambari']['version_full']
  action :install
  notifies :create, 'template[create_/tmp/postgres_create_ambari_db.sql]', :immediately
  notifies :run, 'bash[create_ambari_postgres_db]', :immediately
  notifies :create, 'template[create_/tmp/postgres_create_ambari_schema.sql]', :immediately
  notifies :run, 'bash[create_ambari_postgres_schema]', :immediately
  notifies :run, 'bash[config_ambari_server]', :immediately
  not_if do ::File.exists?('/etc/rc.d/init.d/ambari-server') end
end
