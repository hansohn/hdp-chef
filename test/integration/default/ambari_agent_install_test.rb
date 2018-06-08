# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_agent_install

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_agent_install' do
  title 'Testing ambari-agent installation'

  describe package('openssl-devel') do
    it { should be_installed }
  end

  describe package('python') do
    it { should be_installed }
  end

  describe package('ambari-agent') do
    it { should be_installed }
  end
end
