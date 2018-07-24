# # encoding: utf-8

# Inspec test for recipe hdp-chef::config_update_hostfile

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::config_update_hostfile' do
  title 'Testing hostfile'

  describe sys_info do
    its('hostname') { should eq 'ambari-server' }
  end

  describe etc_hosts.where { primary_name == 'ambari-server' } do
    its('ip_address') { should_not cmp '127.0.0.1' }
  end
end
