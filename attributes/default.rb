# java
default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'a47dc0962a57b27a0cc00b9f11a53dc3add40c98633ba49a2419b845e4dedf43'
default['java']['oracle']['jce']['enabled'] = true
default['java']['oracle']['jce']['home'] = '/usr/jdk64/'
default['java']['oracle']['jce']['java_version']['url'] = 'http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip'
default['java']['oracle']['jce']['java_version']['checksum'] = 'f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59'

# repo
default['hdp']['version'] = '2.5.0'
default['hdp']['repo']['ambari'] = "http://public-repo-1.hortonworks.com/ambari/centos#{node['platform_version'].to_i}/2.x/updates/2.4.1.0/ambari.repo"
case node['hdp']['version']
when '2.4.3'
  default['hdp']['repo']['hdp'] = "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.4.3.0/hdp.repo"
when '2.5.0'
  default['hdp']['repo']['hdp'] = "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.0.0/hdp.repo"
end

# config
default['hdp']['ambari-server']['config']['api_ssl'] = 'false'
default['hdp']['ambari-server']['config']['api_ssl_cert_name'] = 'https.crt'
default['hdp']['ambari-server']['config']['api_ssl_key_name'] = 'https.key'
default['hdp']['ambari-server']['config']['api_ssl_port'] = '8443'
default['hdp']['ambari-server']['config']['jdbc_database_name'] = 'ambari'
default['hdp']['ambari-server']['config']['jdbc_database'] = 'postgres'
default['hdp']['ambari-server']['config']['jdbc_postgres_schema'] = 'ambari'
default['hdp']['ambari-server']['config']['jdbc_user_name'] = 'ambari'
default['hdp']['ambari-server']['config']['jdbc_user_password'] = '/etc/ambari-server/conf/password.dat'
default['hdp']['ambari-server']['config']['ldap_is_configured'] = 'false'
default['hdp']['ambari-server']['config']['ldap_bind_anonymously'] = 'false'
default['hdp']['ambari-server']['config']['ldap_dn_attribute'] = 'dn'
default['hdp']['ambari-server']['config']['ldap_group_membership_attr'] = 'memberUid'
default['hdp']['ambari-server']['config']['ldap_group_naming_attr'] = 'cn'
default['hdp']['ambari-server']['config']['ldap_group_object_class'] = 'posixgroup'
default['hdp']['ambari-server']['config']['ldap_manager_password'] = '/etc/ambari-server/conf/ldap-password.dat'
default['hdp']['ambari-server']['config']['ldap_referral'] = 'follow'
default['hdp']['ambari-server']['config']['ldap_use_ssl'] = 'true'
default['hdp']['ambari-server']['config']['ldap_user_object_class'] = 'person'
default['hdp']['ambari-server']['config']['ldap_username_attribute'] = 'uid'
default['hdp']['ambari-server']['config']['ssl_truststore_enabled'] = 'false'
default['hdp']['ambari-server']['config']['ssl_truststore_password'] = 'changeit'
default['hdp']['ambari-server']['config']['ssl_truststore_path'] = '/var/lib/ambari-server/keys/keystore.jks'
default['hdp']['ambari-server']['config']['ssl_truststore_type'] = 'jks'
default['hdp']['ambari-server']['config']['two_way_ssl'] = 'false'
default['hdp']['ambari-server']['crypto']['ca_cert'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hdp']['ambari-server']['crypto']['https_cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hdp']['ambari-server']['crypto']['https_key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hdp']['ambari-server']['crypto']['https_key_pass'] = 'changeit'
default['hdp']['ambari-server']['crypto']['https_keystore_p12'] = "/etc/pki/tls/certs/#{node['fqdn']}.p12"
default['hdp']['ambari-server']['crypto']['https_keystore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hdp']['ambari-server']['crypto']['ldap_pass'] = 'changeit'
default['hdp']['ambari-server']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hdp']['ambari-server']['crypto']['truststore_pass'] = 'changeit'
default['hdp']['ambari-server']['user']['name'] = 'ambari-server'
default['hdp']['ambari-server']['user']['uid'] = '15010'
default['hdp']['ambari-server']['user']['home'] = '/var/lib/ambari-server'
default['hdp']['ambari-server']['user']['shell'] = '/bin/bash'
default['hdp']['ambari-agent']['config']['ssl_truststore_enabled'] = 'false'
default['hdp']['ambari-agent']['config']['ssl_truststore_password'] = 'changeit'
default['hdp']['ambari-agent']['config']['ssl_truststore_path'] = '/var/lib/ambari-server/keys/keystore.jks'
default['hdp']['ambari-agent']['config']['ssl_truststore_type'] = 'jks'
default['hdp']['ambari-agent']['crypto']['agent_cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hdp']['ambari-agent']['crypto']['agent_key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hdp']['ambari-agent']['crypto']['ca_cert'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hdp']['ambari-agent']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hdp']['ambari-agent']['user']['name'] = 'ambari-agent'
default['hdp']['ambari-agent']['user']['uid'] = '15011'
default['hdp']['ambari-agent']['user']['home'] = '/var/lib/ambari-agent'
default['hdp']['ambari-agent']['user']['shell'] = '/bin/bash'
default['hdp']['hadoop']['group']['name'] = 'hadoop'
default['hdp']['hadoop']['group']['gid'] = '10010'
default['hdp']['hadoop']['user']['name'] = 'hdfs'
default['hdp']['hadoop']['user']['uid'] = '15015'
default['hdp']['hadoop']['user']['home'] = '/home/hdfs'
default['hdp']['hadoop']['user']['shell'] = '/bin/bash'

case node.chef_environment
when 'production'
  default['hdp']['ambari-server']['config']['host_cname'] = 'ambari.prd.domain.local'
  default['hdp']['ambari-server']['config']['ldap_base_dn'] = 'dc=prd,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_manager_dn'] = 'uid=manager,cn=users,cn=accounts,dc=prd,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_primary_url'] = 'ldap-server-01.prd.domain.local:636'
  default['hdp']['ambari-server']['config']['ldap_sync_groups'] = [ 'prd_user_group' ]
  default['hdp']['ambari-server']['config']['ldap_sync_users'] = [ 'prd_user' ]
when 'staging'
  default['hdp']['ambari-server']['config']['host_cname'] = 'ambari.stg.domain.local'
  default['hdp']['ambari-server']['config']['ldap_base_dn'] = 'dc=stg,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_manager_dn'] = 'uid=manager,cn=users,cn=accounts,dc=stg,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_primary_url'] = 'ldap-server-01.stg.domain.local:636'
  default['hdp']['ambari-server']['config']['ldap_sync_groups'] = [ 'stg_user_group' ]
  default['hdp']['ambari-server']['config']['ldap_sync_users'] = [ 'stg_user' ]
else
  default['hdp']['ambari-server']['config']['host_cname'] = 'ambari.dev.domain.local'
  default['hdp']['ambari-server']['config']['ldap_base_dn'] = 'dc=dev,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_manager_dn'] = 'uid=manager,cn=users,cn=accounts,dc=dev,dc=domain,dc=local'
  default['hdp']['ambari-server']['config']['ldap_primary_url'] = 'ldap-server-01.dev.domain.local:636'
  default['hdp']['ambari-server']['config']['ldap_sync_groups'] = [ 'dev_user_group' ]
  default['hdp']['ambari-server']['config']['ldap_sync_users'] = [ 'dev_user' ]
end
