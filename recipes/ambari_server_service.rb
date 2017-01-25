#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_service
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# stop ambari server if not running correctly
bash 'fix_ambari-server_service' do
  code <<-EOF
    if /usr/bin/grep -q "Ambari Server running" <(/etc/rc.d/init.d/ambari-server status) &&
      /usr/bin/grep -qP "(failed|inactive)" <(/bin/systemctl is-active ambari-server); then
        /etc/init.d/ambari-server stop
        sleep 30
    fi
  EOF
end

# systemctl daemon reload
bash 'systemctl_daemon_reload' do
  code 'systemctl daemon-reload'
  action :nothing
end

# create ambari-server service
template 'create_/etc/rc.d/init.d/ambari-server' do
  path '/etc/rc.d/init.d/ambari-server'
  source "ambari-server.service_#{node['hw']['hdp']['version']}.erb"
  sensitive true
  owner node['hw']['ambari']['server']['user']['name']
  group 'root'
  notifies :run, 'bash[systemctl_daemon_reload]', :immediately
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

# start/enable ambari server
service 'start_ambari-server_service' do
  service_name 'ambari-server.service'
  status_command "grep -q 'Ambari Server running' <(/etc/init.d/ambari-server status)"
  action [:start, :enable]
  notifies :run, 'bash[verify_ambari_server_is_responding]', :immediately
end
