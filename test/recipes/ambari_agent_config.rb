# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_agent_config

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_agent_config' do
  title 'Testing ambari-agent configuration'

  describe file('/etc/ambari-agent') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-agent' }
  end

  describe file('/var/lib/ambari-agent') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-agent' }
  end

  describe file('/var/log/ambari-agent') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-agent' }
  end

  describe file('/var/run/ambari-agent') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-agent' }
  end

  describe file('/etc/ambari-agent/conf/ambari-agent.ini') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'ambari-agent' }
    its('content') { should include('File managed by Chef -- changes will be overwritten') }
  end
end
