# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_metrics_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::ambari_metrics_user' do
  title 'Testing ambari-metrics user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('ams') do
    it { should exist }
    its('uid') { should eq 15013 }
    its('home') { should eq '/home/ams' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
