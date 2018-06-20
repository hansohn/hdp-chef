# # encoding: utf-8

# Inspec test for recipe hdp-chef::repo_hdp

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::repo_hdp' do
  title 'Testing Hortonworks HDP repos'

  describe yum.repo('HDP-2.6.5.0') do
    it { should exist }
    it { should be_enabled }
  end

  describe yum.repo('HDP-UTILS-1.1.0.22') do
    it { should exist }
    it { should be_enabled }
  end
end
