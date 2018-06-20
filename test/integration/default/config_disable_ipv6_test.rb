# # encoding: utf-8

# Inspec test for recipe hdp-chef::config_disable_ipv6.rb

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::config_disable_ip' do
  title 'Testing ipv6 disabled'

  describe bash('sysctl net.ipv6.conf.all.disable_ipv6') do
    its('stdout') { should match /net.ipv6.conf.all.disable_ipv6 = 1/ }
    its('exit_status') { should eq 0 }
  end
end
