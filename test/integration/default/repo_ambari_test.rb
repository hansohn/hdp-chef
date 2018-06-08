# # encoding: utf-8

# Inspec test for recipe hdp-chef::repo_ambari

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::repo_ambari' do 
  title 'Testing Ambari repos'

  describe yum.repo('Updates-ambari-2.4.1.0') do
    it { should exist }
    it { should be_enabled }
  end
end
