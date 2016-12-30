#
# Cookbook Name:: hdp-chef
# Recipe:: postgres_create_ambari_db
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# create postgres_create_ambari_db
bash 'create_ambari_postgres_db' do
  code "psql -f '/tmp/postgres_create_ambari_db.sql'"
  user 'postgres'
  action :nothing
end

# create /tmp/postgres_create_ambari_db.sql
template 'create_/tmp/postgres_create_ambari_db.sql' do
  path '/tmp/postgres_create_ambari_db.sql'
  source 'postgres_create_ambari_db.sql.erb'
  sensitive true
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :run, 'bash[create_ambari_postgres_db]', :immediately
end

# create postgres_create_ambari_schema
bash 'create_ambari_postgres_schema' do
  code <<-EOF
    export PGPASSWORD='#{node['hw']['ambari']['server']['config']['jdbc_user_password']}'
    psql -U #{node['hw']['ambari']['server']['config']['jdbc_user_name']} -d #{['hw']['ambari']['server']['config']['jdbc_database_name']} -f '/tmp/postgres_create_ambari_schema.sql'
  EOF
  user 'postgres'
  action :nothing
end

# create /tmp/postgres_create_ambari_schema.sql
template 'create_/tmp/postgres_create_ambari_schema.sql' do
  path '/tmp/postgres_create_ambari_schema.sql'
  source 'postgres_create_ambari_schema.sql.erb'
  sensitive true
  owner 'postgres'
  group 'postgres'
  mode '0600'
  notifies :run, 'bash[create_ambari_postgres_schema]', :immediately
end
