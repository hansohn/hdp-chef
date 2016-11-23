# # encoding: utf-8

# Inspec test for recipe hdp-chef::ambari_server_config

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


control 'hdp-chef::ambari_server_config' do
  title 'Testing ambari-server configuration'

  unless os.windows?
    describe user('root') do
      it { should exist }
      skip 'This is an example test, replace with your own test.'
    end
  end

  describe port(80) do
    it { should_not be_listening }
    skip 'This is an example test, replace with your own test.'
  end
end
