# # encoding: utf-8

# Inspec test for recipe hdp-chef::oozie_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::oozie_user' do
  title 'Testing oozie user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('oozie') do
    it { should exist }
    its('uid') { should eq 15024 }
    its('home') { should eq '/home/oozie' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
