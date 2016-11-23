#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_agent_service
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# stop ambari agent if not running correctly
bash 'fix_ambari-agent_service' do
  code <<-EOF
    if /usr/bin/grep -q "Ambari Agent running" <(/etc/rc.d/init.d/ambari-agent status) &&
      /usr/bin/grep -q "failed" <(/bin/systemctl is-active ambari-agent); then
        /etc/init.d/ambari-agent stop
        sleep 30
    fi
  EOF
end

# start/enable amabri agent
service 'start_ambari-agent_service' do
  service_name 'ambari-agent.service'
  status_command "grep -q 'Ambari Agent running' <(/etc/init.d/ambari-agent status)"
  action [:start, :enable]
end
