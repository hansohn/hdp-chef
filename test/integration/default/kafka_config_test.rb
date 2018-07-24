# # encoding: utf-8

# Inspec test for recipe hdp-chef::kafka_config

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::kafka_config' do
  title 'Testing kafka config'

  describe file('/kafka-logs') do
    it { should be_directory }
    its('owner') { should eq 'kafka' }
    its('group') { should eq 'hadoop' }
  end
end
