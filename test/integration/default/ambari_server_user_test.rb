# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_server_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::ambari_server_user' do
  title 'Testing ambari-server user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('ambari-server') do
    it { should exist }
    its('uid') { should eq 15010 }
    its('home') { should eq '/var/lib/ambari-server' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end

  describe file('/etc/sudoers.d/ambari-server') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end
