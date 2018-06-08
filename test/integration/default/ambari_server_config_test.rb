# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_server_config

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_server_config' do
  title 'Testing ambari-server configuration'

  describe file('/etc/ambari-server') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-server' }
  end

  describe file('/var/lib/ambari-server') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-server' }
  end

  describe file('/var/log/ambari-server') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-server' }
  end

  describe file('/var/run/ambari-server') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'ambari-server' }
  end

  describe file('/etc/ambari-server/conf/ambari.properties') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'ambari-server' }
    its('content') { should include('ambari-server.user=ambari-server') }
  end
end
