# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_agent_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::ambari_agent_user' do
  title 'Testing amabri-agent user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('ambari-agent') do
    it { should exist }
    its('uid') { should eq 15011 }
    its('home') { should eq '/var/lib/ambari-agent' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end

  describe file('/etc/sudoers.d/ambari-agent') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end
