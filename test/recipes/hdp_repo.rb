# # encoding: utf-8

# Inspec test for recipe hdp-chef::hdp_repo

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::hdp_repo' do 
  title 'Testing Ambari & Hortonworks repos'

  describe yum.repo('HDP-2.5.0.0') do
    it { should exist }
    it { should be_enabled }
  end

  describe yum.repo('HDP-UTILS-1.1.0.21') do
    it { should exist }
    it { should be_enabled }
  end

  describe yum.repo('Updates-ambari-2.4.1.0') do
    it { should exist }
    it { should be_enabled }
  end
end
