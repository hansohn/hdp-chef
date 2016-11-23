#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_service
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# stop ambari server if not running correctly
bash 'fix_ambari-server_service' do
  code <<-EOF
    if /usr/bin/grep -q "Ambari Server running" <(/etc/rc.d/init.d/ambari-server status) &&
      /usr/bin/grep -q "failed" <(/bin/systemctl is-active ambari-server); then
        /etc/init.d/ambari-server stop
        sleep 30
    fi
  EOF
end

# create amabri-server service
template 'create_/etc/rc.d/init.d/ambari-server' do
  path '/etc/rc.d/init.d/ambari-server'
  source "ambari-server.service_#{node['hdp']['version']}.erb"
  owner node['hdp']['ambari-server']['user']['name']
  group 'root'
end

# start/enable amabri server
service 'start_ambari-server_service' do
  service_name 'ambari-server.service'
  status_command "grep -q 'Ambari Server running' <(/etc/init.d/ambari-server status)"
  action [:start, :enable]
end
