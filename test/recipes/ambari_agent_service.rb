# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_agent_service

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_agent_service' do
  title 'Testing ambari-agent service'

  describe service('ambari-agent') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
