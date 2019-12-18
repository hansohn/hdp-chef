# # encoding: utf-8

# Inspec test for recipe hdp-chef::oozie_lib

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::oozie_lib' do
  title 'Testing oozie lib'

  describe file('/usr/hdp/3.1.4.0-315/oozie') do
    it { should be_directory }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/usr/hdp/3.1.4.0-315/oozie/share/lib') do
    it { should be_directory }
    its('owner') { should eq 'oozie' }
    its('group') { should eq 'hadoop' }
  end
end
