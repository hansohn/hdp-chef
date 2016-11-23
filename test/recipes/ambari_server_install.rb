# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_server_install

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::ambari_server_install' do
  title 'Testing ambari-server installation'

  describe package('openssl-devel') do
    it { should be_installed }
  end

  describe package('postgresql') do
    it { should be_installed }
  end

  describe package('python') do
    it { should be_installed }
  end

  describe package('ambari-server') do
    it { should be_installed }
  end

  describe service('postgresql') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
