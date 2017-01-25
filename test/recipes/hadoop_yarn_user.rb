# # encoding: utf-8

# Inspec test for recipe hdp-chef::hadoop_yarn_user

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::hadoop_yarn_user' do
  title 'Testing hadoop yarn user'

  describe group('hadoop') do
    it { should exist }
    its('gid') { should eq 10010 }
  end

  describe user('yarn') do
    it { should exist }
    its('uid') { should eq 15029 }
    its('home') { should eq '/home/yarn' }
    its('shell') { should eq '/bin/bash' }
    its('group') { should eq 'hadoop' }
  end
end
