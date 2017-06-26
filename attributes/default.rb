# java
default['java']['install_from'] = 'oracle_source'
default['java']['install_version'] = 'jdk-8u131-linux-x64'

# hortonworks ambari repo
default['hw']['ambari']['version'] = '2.4.1'
case node['hw']['ambari']['version']
when '2.4.1'
  default['hw']['ambari']['version_full'] = '2.4.1.0-22'
  default['hw']['ambari']['repo'] = "http://public-repo-1.hortonworks.com/ambari/centos#{node['platform_version'].to_i}/2.x/updates/2.4.1.0/ambari.repo"
when '2.4.2'
  default['hw']['ambari']['version_full'] = '2.4.2.0-1470'
  default['hw']['ambari']['repo'] = "http://public-repo-1.hortonworks.com/ambari/centos#{node['platform_version'].to_i}/2.x/updates/2.4.2.0/ambari.repo"
end

# hortonworks hdp repo
default['hw']['hdp']['version'] = '2.5.0'
case node['hw']['hdp']['version']
when '2.4.3'
  default['hw']['hdp']['version_full'] = '2.4.3.0-227'
  default['hw']['hdp']['repo'] = "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.4.3.0/hdp.repo"
when '2.5.0'
  default['hw']['hdp']['version_full'] = '2.5.0.0-1245'
  default['hw']['hdp']['repo'] = "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.0.0/hdp.repo"
when '2.5.3'
  default['hw']['hdp']['version_full'] = '2.5.3.0-37'
  default['hw']['hdp']['repo'] = "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.3.0/hdp.repo"
end

# hortonworks hdp cluster
default['hw']['hdp']['cluster']['name'] = 'hdp_demo'
default['hw']['hdp']['cluster']['blueprint_name'] = 'hdp_2.5.0_demo_blueprint'
default['hw']['hdp']['cluster']['blueprint_file'] = 'hdp_2.5.0_demo_blueprint.json'
default['hw']['hdp']['cluster']['hostmapping_file'] = 'hdp_2.5.0_demo_hostmapping.json'

# hortonworks hdf repo
default['hw']['hdf']['version'] = '2.1.1'
case node['hw']['hdf']['version']
when '2.1.1'
  default['hw']['hdf']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/hdf.repo"
  default['hw']['hdf']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.1.0-2.tar.gz"
  default['hw']['hdf']['mgmt_pack']['checksum'] = '1f85395a63573ef7b3ff8cbbb6822b1f46615383c0219ac0064e0739b8634591'
when '2.1.2'
  default['hw']['hdf']['repo'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/hdf.repo"
  default['hw']['hdf']['mgmt_pack']['url'] = "http://public-repo-1.hortonworks.com/HDF/centos#{node['platform_version'].to_i}/2.x/updates/2.1.2.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.1.2.0-10.tar.gz"
  default['hw']['hdf']['mgmt_pack']['checksum'] = 'c3705419c0ca53935bb8edb13cb6de35214f18d37f8d7aa03890ea6574caf7e6'
end

# hortonworks hdf cluster
default['hw']['hdf']['cluster']['name'] = 'hdf_demo'
default['hw']['hdf']['cluster']['blueprint_name'] = 'hdf_2.1.1_demo_blueprint'
default['hw']['hdf']['cluster']['blueprint_file'] = 'hdf_2.1.1_demo_blueprint.json'
default['hw']['hdf']['cluster']['hostmapping_file'] = 'hdf_2.1.1_demo_hostmapping.json'

# config
default['hw']['ambari']['server']['setup']['db']['databasehost'] = 'localhost'
default['hw']['ambari']['server']['setup']['db']['databaseport'] = '5432'
default['hw']['ambari']['server']['setup']['db']['databasepassword'] = 'bigdata'
default['hw']['ambari']['server']['setup']['security']['setup-truststore'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['ambari.ldap.isConfigured'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['api.ssl'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.bindAnonymously'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.dnAttribute'] = 'dn'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupMembershipAttr'] = 'memberUid'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupNamingAttr'] = 'cn'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.groupObjectClass'] = 'posixgroup'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerPassword'] = '/etc/ambari-server/conf/ldap-password.dat'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.referral'] = 'follow'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.usernameAttribute'] = 'uid'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.userObjectClass'] = 'person'
default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.useSSL'] = 'true'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.port'] = '8080'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.cert_name'] = 'https.crt'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.key_name'] = 'https.key'
default['hw']['ambari']['server']['config']['ambari.properties']['client.api.ssl.port'] = '8443'
default['hw']['ambari']['server']['config']['ambari.properties']['security.server.two_way_ssl'] = 'false'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database_name'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.database'] = 'postgres'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.postgres.schema'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.name'] = 'ambari'
default['hw']['ambari']['server']['config']['ambari.properties']['server.jdbc.user.passwd'] = '/etc/ambari-server/conf/password.dat'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.password'] = 'changeit'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.path'] = '/var/lib/ambari-server/keys/keystore.jks'
default['hw']['ambari']['server']['config']['ambari.properties']['ssl.trustStore.type'] = 'jks'
default['hw']['ambari']['server']['crypto']['ca'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hw']['ambari']['server']['crypto']['https_cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hw']['ambari']['server']['crypto']['https_key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hw']['ambari']['server']['crypto']['https_key_pass'] = 'changeit'
default['hw']['ambari']['server']['crypto']['https_keystore_p12'] = "/etc/pki/tls/certs/#{node['fqdn']}.p12"
default['hw']['ambari']['server']['crypto']['https_keystore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['server']['crypto']['ldap_pass'] = 'changeit'
default['hw']['ambari']['server']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['server']['crypto']['truststore_pass'] = 'changeit'
default['hw']['ambari']['server']['user']['name'] = 'ambari-server'
default['hw']['ambari']['server']['user']['uid'] = '15010'
default['hw']['ambari']['server']['user']['home'] = '/var/lib/ambari-server'
default['hw']['ambari']['server']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['agent']['setup']['security']['setup-truststore'] = 'false'
default['hw']['ambari']['agent']['config']['ambari-agent.ini']['keysdir'] = '/var/lib/ambari-agent/keys'
default['hw']['ambari']['agent']['crypto']['cert'] = "/etc/pki/tls/certs/#{node['fqdn']}.crt"
default['hw']['ambari']['agent']['crypto']['key'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
default['hw']['ambari']['agent']['crypto']['ca'] = '/etc/pki/ca-trust/source/anchors/ca.crt'
default['hw']['ambari']['agent']['crypto']['truststore_jks'] = "/etc/pki/tls/certs/#{node['fqdn']}.jks"
default['hw']['ambari']['agent']['user']['name'] = 'ambari-agent'
default['hw']['ambari']['agent']['user']['home'] = '/var/lib/ambari-agent'
default['hw']['ambari']['agent']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['agent']['user']['uid'] = '15011'
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_keystore_location'] = "/etc/security/serverKeys/infra.solr.keyStore.jks"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_keystore_type'] = "jks"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_keystore_password'] = "changeit"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_port'] = "8886"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_ssl_enabled'] = "false"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_truststore_location'] = "/etc/security/serverKeys/infra.solr.trustStore.jks"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_truststore_type'] = "jks"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_truststore_password'] = "changeit"
default['hw']['ambari']['infra']['config']['infra-solr-env']['infra_solr_user'] = "infra-solr"
default['hw']['ambari']['infra']['crypto']['keystore_jks'] = "/var/lib/ambari-infra-solr/keys/infra.solr.keyStore.jks"
default['hw']['ambari']['infra']['crypto']['truststore_jks'] = "/var/lib/ambari-infra-solr/keys/infra.solr.trustStore.jks"
default['hw']['ambari']['infra']['user']['name'] = 'infra-solr'
default['hw']['ambari']['infra']['user']['home'] = '/home/infra-solr'
default['hw']['ambari']['infra']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['infra']['user']['uid'] = '15018'
default['hw']['ambari']['metrics']['config']['ams-grafana-env']['metrics_grafana_data_dir'] = '/var/lib/ambari-metrics-grafana'
default['hw']['ambari']['metrics']['config']['ams-grafana-env']['metrics_grafana_username'] = 'admin'
default['hw']['ambari']['metrics']['config']['ams-grafana-env']['metrics_grafana_password'] = 'admin'
default['hw']['ambari']['metrics']['config']['ams-grafana-ini']['cert_file'] = '/etc/ambari-metrics-grafana/conf/ams-grafana.crt'
default['hw']['ambari']['metrics']['config']['ams-grafana-ini']['cert_key'] = '/etc/ambari-metrics-grafana/conf/ams-grafana.key'
default['hw']['ambari']['metrics']['config']['ams-grafana-ini']['port'] = '3000'
default['hw']['ambari']['metrics']['config']['ams-grafana-ini']['protocol'] = 'http'
default['hw']['ambari']['metrics']['config']['ams-hbase-site']['hbase.rootdir'] = 'file:///var/lib/ambari-metrics-collector/hbase'
default['hw']['ambari']['metrics']['config']['ams-hbase-site']['hbase.tmp.dir'] = '/var/lib/ambari-metrics-collector/hbase-tmp'
default['hw']['ambari']['metrics']['config']['ams-site']['timeline.metrics.aggregator.checkpoint.dir'] = '/var/lib/ambari-metrics-collector/checkpoint'
default['hw']['ambari']['metrics']['crypto']['cert'] = "/etc/ambari-metrics-grafana/conf/ams-grafana.crt"
default['hw']['ambari']['metrics']['crypto']['key'] = "/etc/ambari-metrics-grafana/conf/ams-grafana.key"
default['hw']['ambari']['metrics']['user']['name'] = 'ams'
default['hw']['ambari']['metrics']['user']['home'] = '/home/ams'
default['hw']['ambari']['metrics']['user']['shell'] = '/bin/bash'
default['hw']['ambari']['metrics']['user']['uid'] = '15013'
default['hw']['hadoop']['common']['group']['name'] = 'hadoop'
default['hw']['hadoop']['common']['group']['gid'] = '10010'
default['hw']['hadoop']['hdfs']['config']['hdfs-site']['dfs.datanode.data.dir'] = '/hadoop/hdfs/data'
default['hw']['hadoop']['hdfs']['config']['hdfs-site']['dfs.datanode.failed.volumes.tolerated'] = '0'
default['hw']['hadoop']['hdfs']['config']['hdfs-site']['dfs.namenode.acls.enabled'] = 'true'
default['hw']['hadoop']['hdfs']['config']['hdfs-site']['dfs.namenode.name.dir'] = '/hadoop/hdfs/namenode'
default['hw']['hadoop']['hdfs']['user']['name'] = 'hdfs'
default['hw']['hadoop']['hdfs']['user']['home'] = '/home/hdfs'
default['hw']['hadoop']['hdfs']['user']['shell'] = '/bin/bash'
default['hw']['hadoop']['hdfs']['user']['uid'] = '15016'
default['hw']['hadoop']['yarn']['config']['yarn-site']['yarn.nodemanager.local-dirs'] = '/hadoop/yarn/local'
default['hw']['hadoop']['yarn']['config']['yarn-site']['yarn.nodemanager.log-dirs'] = '/hadoop/yarn/log'
default['hw']['hadoop']['yarn']['config']['yarn-site']['yarn.timeline-service.leveldb-state-store.path'] = '/hadoop/yarn/timeline'
default['hw']['hadoop']['yarn']['config']['yarn-site']['yarn.timeline-service.leveldb-timeline-store.path'] = '/hadoop/yarn/timeline'
default['hw']['hadoop']['yarn']['user']['name'] = 'yarn'
default['hw']['hadoop']['yarn']['user']['home'] = '/home/yarn'
default['hw']['hadoop']['yarn']['user']['shell'] = '/bin/bash'
default['hw']['hadoop']['yarn']['user']['uid'] = '15029'
default['hw']['hive']['config']['hive-site']['javax.jdo.option.ConnectionPassword'] = 'Welcome12345'
default['hw']['hive']['user']['name'] = 'hive'
default['hw']['hive']['user']['home'] = '/home/hive'
default['hw']['hive']['user']['shell'] = '/bin/bash'
default['hw']['hive']['user']['uid'] = '15017'
default['hw']['kafka']['config']['kafka-broker']['auto.create.topics.enable'] = 'true'
default['hw']['kafka']['config']['kafka-broker']['default.replication.factor'] = '2'
default['hw']['kafka']['config']['kafka-broker']['delete.topic.enable'] = 'false'
default['hw']['kafka']['config']['kafka-broker']['log.dirs'] = '/kafka-logs'
default['hw']['kafka']['config']['kafka-broker']['log.retention.hours'] = '-1'
default['hw']['kafka']['config']['kafka-broker']['num.partitions'] = '3'
default['hw']['kafka']['user']['name'] = 'kafka'
default['hw']['kafka']['user']['home'] = '/home/kafka'
default['hw']['kafka']['user']['shell'] = '/bin/bash'
default['hw']['kafka']['user']['uid'] = '15019'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_keystore_location'] = '/etc/security/serverKeys/logsearch.keyStore.jks'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_keystore_type'] = 'jks'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_keystore_password'] = 'changeit'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_truststore_location'] = '/etc/security/serverKeys/logsearch.trustStore.jks'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_keystore_location'] = 'jks'
default['hw']['logsearch']['config']['logfeeder-env']['logfeeder_truststore_password'] = 'changeit'
default['hw']['logsearch']['config']['logsearch-admin-json']['logsearch_admin_username'] = 'ambari_logsearch_admin'
default['hw']['logsearch']['config']['logsearch-admin-json']['logsearch_admin_password'] = 'ambari_logsearch_password'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_keystore_location'] = '/etc/security/serverKeys/logsearch.keyStore.jks'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_keystore_type'] = 'jks'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_keystore_password'] = 'changeit'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_truststore_location'] = '/etc/security/serverKeys/logsearch.trustStore.jks'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_truststore_type'] = 'jks'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_truststore_password'] = 'changeit'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_ui_port'] = '61888'
default['hw']['logsearch']['config']['logsearch-env']['logsearch_ui_protocol'] = 'http'
default['hw']['logsearch']['crypto']['keystore_jks'] = "/var/lib/logsearch/keys/logsearch.keyStore.jks"
default['hw']['logsearch']['crypto']['truststore_jks'] = "/var/lib/logsearch/keys/logsearch.trustStore.jks"
default['hw']['logsearch']['user']['name'] = 'logsearch'
default['hw']['logsearch']['user']['home'] = '/home/logsearch'
default['hw']['logsearch']['user']['shell'] = '/bin/bash'
default['hw']['logsearch']['user']['uid'] = '15021'
default['hw']['nifi']['config']['nifi-ambari-config']['nifi.security.encrypt.configuration.password'] = 'Welcome12345'
default['hw']['nifi']['config']['nifi-ambari-config']['nifi.sensitive.props.key'] = 'Welcome12345'
default['hw']['nifi']['config']['nifi-ambari-ssl-config']['nifi.toolkit.tls.token'] = 'changeit'
default['hw']['oozie']['config']['oozie-site']['oozie.service.JPAService.jdbc.password'] = 'Welcome12345'
default['hw']['oozie']['lib']['sqoop']['jars_install'] = {
  'jtds' => {
    'name '=> 'jtds-1.3.1.jar',
    'source' => 'http://central.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar',
    'checksum' => 'aac05ebf5504c91b29420129b02dd878a86c52f8fa6eccf9235e0bfd7a60bef1'
  },
  'kite-data-core' => {
    'name' => 'kite-data-core-1.1.0.jar',
    'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-core/1.1.0/kite-data-core-1.1.0.jar',
    'checksum' => '0fa00b157ef861138a9f45752da9e7b75f4b492870ca5e4061337437d64199ad'
  },
  'kite-data-hive' => {
    'name' => 'kite-data-hive-1.1.0.jar',
    'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-hive/1.1.0/kite-data-hive-1.1.0.jar',
    'checksum' => 'f13ce2d0006dc6ab2e1892f44c1c0cdd372883c98563437504b52b0bb08c55a7'
  },
  'kite-data-mapreduce' => {
    'name' => 'kite-data-mapreduce-1.1.0.jar',
    'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-mapreduce/1.1.0/kite-data-mapreduce-1.1.0.jar',
    'checksum' => '76776802fa23a3263802cc8f6b22016498aa07b342af50a46673e7ecd022cbdf'
  },
  'kite-hadoop-compatibility' => {
    'name' => 'kite-hadoop-compatibility-1.1.0.jar',
    'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-hadoop-compatibility/1.1.0/kite-hadoop-compatibility-1.1.0.jar',
    'checksum' => '09cdf5a839c3e21283adf2acf9ea01d9e307e5ddbda93061f6bca24719578b3d'
  }
}
default['hw']['oozie']['lib']['sqoop']['jars_remove'] = [
  'kite-data-core-1.0.0.jar', 
  'kite-data-hive-1.0.0.jar', 
  'kite-data-mapreduce-1.0.0.jar', 
  'kite-hadoop-compatibility-1.0.0.jar'
]
default['hw']['oozie']['user']['name'] = 'oozie'
default['hw']['oozie']['user']['home'] = '/home/oozie'
default['hw']['oozie']['user']['shell'] = '/bin/bash'
default['hw']['oozie']['user']['uid'] = '15024'


case node.chef_environment
when 'production'
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.prd.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=prd,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=prd,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.prd.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = [ 'prd_user_group' ]
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = [ 'prd_user' ]
when 'staging'
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.stg.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=stg,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=stg,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.stg.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = [ 'stg_user_group' ]
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = [ 'stg_user' ]
else
  default['hw']['ambari']['server']['config']['ambari.properties']['host_cname'] = 'ambari.dev.domain.local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.baseDn'] = 'dc=dev,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.managerDn'] = 'uid=manager,cn=users,cn=accounts,dc=dev,dc=domain,dc=local'
  default['hw']['ambari']['server']['config']['ambari.properties']['authentication.ldap.primaryUrl'] = 'ldap-server-01.dev.domain.local:636'
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_groups'] = [ 'dev_user_group' ]
  default['hw']['ambari']['server']['setup']['ldap']['ldap_sync_users'] = [ 'dev_user' ]
end
