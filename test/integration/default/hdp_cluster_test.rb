# # encoding: utf-8

# Inspec test for recipe hdp-chef::hdp_cluster

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::hdp_cluster' do
  title 'Testing hdp cluster installation'

  describe file('/var/lib/ambari-clusters') do
    it { should be_directory }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-clusters/hdp_2.5.0_demo_blueprint.json') do
    it { should be_file }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe file('/var/lib/ambari-clusters/hdp_2.5.0_demo_hostmapping.json') do
    it { should be_file }
    its('owner') { should eq 'ambari-server' }
    its('group') { should eq 'root' }
  end

  describe bash("curl -H 'X-Requested-By: ambari' -u admin:admin http://ambari-server:8080/api/v1/blueprints") do
    its('stdout') { should match /hdp_2.5.0_demo_blueprint/ }
    its('exit_status') { should eq 0 }
  end

  describe bash("curl -H 'X-Requested-By: ambari' -u admin:admin http://ambari-server:8080/api/v1/clusters/hdp_demo") do
    its('exit_status') { should eq 0 }
  end
end
