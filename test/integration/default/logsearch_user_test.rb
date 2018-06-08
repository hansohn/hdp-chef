# # encoding: utf-8

# Inspec test for recipe hdp-chef::logsearch_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::logsearch_user' do
  title 'Testing logsearch user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('logsearch') do
    it { should exist }
    its('uid') { should eq 15021 }
    its('home') { should eq '/home/logsearch' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
