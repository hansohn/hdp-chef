# # encoding: utf-8

# Inspec test for recipe hdp-chef::repo_ambari

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::repo_ambari' do
  title 'Testing Ambari repos'

  describe yum.repo('ambari-2.6.2.0') do
    it { should exist }
    it { should be_enabled }
  end
end
