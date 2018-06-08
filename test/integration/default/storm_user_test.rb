# # encoding: utf-8

# Inspec test for recipe hdp-chef::storm_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::storm_user' do
  title 'Testing storm user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('storm') do
    it { should exist }
    its('uid') { should eq 15028 }
    its('home') { should eq '/home/storm' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
