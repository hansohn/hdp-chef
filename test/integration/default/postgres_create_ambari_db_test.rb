# # encoding: utf-8

# Inspec test for recipe hdp-chef::postgres_create_ambari_db

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

control 'hdp-chef::postgres_create_ambari_db' do
  title 'Testing postgres ambari db installation'

  describe file('/tmp/postgres_create_ambari_db.sql') do
    it { should be_file }
    its('owner') { should eq 'postgres' }
    its('group') { should eq 'postgres' }
    its('mode') { should cmp '0600' }
  end

  describe file('/tmp/postgres_create_ambari_schema.sql') do
    it { should be_file }
    its('owner') { should eq 'postgres' }
    its('group') { should eq 'postgres' }
    its('mode') { should cmp '0600' }
  end
end
