# # encoding: utf-8

# Inspec test for recipe hdp-chef::kafka_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::kafka_user' do
  title 'Testing kafka user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('kafka') do
    it { should exist }
    its('uid') { should eq 15019 }
    its('home') { should eq '/home/kafka' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
