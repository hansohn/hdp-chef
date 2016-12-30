#
# Cookbook Name:: hdp-chef
# Recipe:: postgres_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# initialize default postgresql db
bash 'initialize_postgres_db' do
  code 'postgresql-setup initdb'
  action :nothing
end

# update pg_hba.conf for authentication
template 'create_/var/lib/pgsql/data/pg_hba.conf' do
  path '/var/lib/pgsql/data/pg_hba.conf'
  source 'postgres_pg_hba.conf.erb'
  sensitive true
  owner 'postgres'
  group 'postgres'
  mode '0600'
  action :nothing
end

# install postgresql-server
package 'install_postgres' do
  package_name [ 'postgresql-server', 'postgresql' ]
  action :install
  notifies :run, 'bash[initialize_postgres_db]', :immediately
  notifies :create, 'template[create_/var/lib/pgsql/data/pg_hba.conf]', :immediately
  notifies :restart, 'service[postgresql]', :immediately
end

# start/enable postgresql service
service 'postgresql' do
  action [:start, :enable]
end
