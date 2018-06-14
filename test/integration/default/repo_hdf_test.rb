# # encoding: utf-8

# Inspec test for recipe hdp-chef::repo_hdf

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::repo_hdf' do
  title 'Testing Hortonworks HDF repos'

  describe yum.repo('HDF-2.1.1.0') do
    it { should exist }
    it { should be_enabled }
  end

  describe yum.repo('HDP-UTILS-1.1.0.21') do
    it { should exist }
    it { should be_enabled }
  end
end
