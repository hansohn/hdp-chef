# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_infra_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_infra_user' do
  title 'Testing ambari-infra user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('infra-solr') do
    it { should exist }
    its('uid') { should eq 15018 }
    its('home') { should eq '/home/infra-solr' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
