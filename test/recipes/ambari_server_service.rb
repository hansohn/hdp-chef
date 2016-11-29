# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_server_service

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::ambari_server_service' do
  title 'Testing ambari-server service'

  describe service('ambari-server') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(8080) do
    it { should be_listening }
  end

  describe port(8440) do
    it { should be_listening }
  end
end
