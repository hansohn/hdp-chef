# # encoding: utf-8

# Inspec test for recipe hdp-chef::postgres_install

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::postgres_install' do
  title 'Testing postgres installation'

  describe package('postgresql-server') do
    it { should be_installed }
  end

  describe service('postgresql') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(5432) do
    it { should be_listening }
    its('addresses') { should include '127.0.0.1' }
  end
end
