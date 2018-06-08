# # encoding: utf-8

# Inspec test for recipe hdp-chef::config_disable_ipv6.rb

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::config_disable_ip' do
  title 'Testing ipv6 disabled'

  describe file('/etc/sysctl.d/99-chef-attributes.conf') do
    it { should be_file }
    its('content') { should include('net.ipv6.conf.all.disable_ipv6=1') }
    its('content') { should include('net.ipv6.conf.default.disable_ipv6=1') }
  end
end
