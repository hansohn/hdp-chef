# -- PYTHON --
override['python'] = {
  'python2' => {
    'packages' => ['python'],
  },
}

# -- JAVA --
override['java'] = {
  'install_from' => 'amazon_source',
  'install_version' => 'jdk-8u232-linux-x64',
}

# -- AMBARI --
override['hw']['ambari'] = {
  'version' => '2.7.4',
}

# -- HDP CLUSTER --
override['hw']['cluster'] = {
  'name' => 'hdp_demo',
  'blueprint_name' => 'hdp_demo_3.1.4_blueprint',
  'blueprint_file' => 'hdp_demo_3.1.4_blueprint.json',
  'hostmapping_file' => 'hdp_demo_3.1.4_hostmapping.json',
  'version_definition_file' => 'hdp_demo_3.1.4_vdf.json',
}

# -- HORTONWORKS HDP --
default['hw']['hdp'] = {
  'version' => '3.1.4',
  '2.4.3' => {
    'version_full' => '2.4.3.0-227',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.4.3.0/HDP-2.4.3.0-227.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.4.3.0/hdp.repo",
    },
  },
  '2.5.0' => {
    'version_full' => '2.5.0.0-1245',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.0.0/HDP-2.5.0.0-1245.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.0.0/hdp.repo",
    },
  },
  '2.5.3' => {
    'version_full' => '2.5.3.0-37',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.6.5.0/HDP-2.5.3.0-37.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.3.0/hdp.repo",
    },
  },
  '2.5.6' => {
    'version_full' => '2.5.6.0-40',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.6.0/HDP-2.5.6.0-40.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.5.6.0/hdp.repo",
    },
  },
  '2.6.5' => {
    'version_full' => '2.6.5.0-292',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.6.5.0/HDP-2.6.5.0-292.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/2.x/updates/2.6.5.0/hdp.repo",
      'hdp.gpl' => "http://public-repo-1.hortonworks.com/HDP-GPL/centos#{node['platform_version'].to_i}/2.x/updates/2.6.5.0/hdp.gpl.repo",
    },
  },
  '3.0.0' => {
    'version_full' => '3.0.0.0-1634',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/3.x/updates/3.0.0.0/HDP-3.0.0.0-1634.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/3.x/updates/3.0.0.0/hdp.repo",
      'hdp.gpl' => "http://public-repo-1.hortonworks.com/HDP-GPL/centos#{node['platform_version'].to_i}/3.x/updates/3.0.0.0/hdp.gpl.repo",
    },
  },
  '3.1.4' => {
    'version_full' => '3.1.4.0-315',
    'vdf' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/3.x/updates/3.1.4.0/HDP-3.1.4.0-315.xml",
    'repos' => {
      'hdp' => "http://public-repo-1.hortonworks.com/HDP/centos#{node['platform_version'].to_i}/3.x/updates/3.1.4.0/hdp.repo",
      'hdp.gpl' => "http://public-repo-1.hortonworks.com/HDP-GPL/centos#{node['platform_version'].to_i}/3.x/updates/3.1.4.0/hdp.gpl.repo",
    },
  },
}

# -- HADOOP --
default['hw']['hadoop'] = {
  'common' => {
    'group' => {
      'name' => 'hadoop',
      'gid' => '10010',
    },
  },
  'hdfs' => {
    'config' => {
      'hdfs-site' => {
        'dfs.datanode.data.dir' => '/hadoop/hdfs/data',
        'dfs.datanode.failed.volumes.tolerated' => '0',
        'dfs.namenode.acls.enabled' => 'true',
        'dfs.namenode.name.dir' => '/hadoop/hdfs/namenode',
      },
    },
    'user' => {
      'name' => 'hdfs',
      'home' => '/home/hdfs',
      'shell' => '/bin/bash',
      'uid' => '15016',
    },
  },
  'yarn' => {
    'config' => {
      'yarn-site' => {
        'yarn.resourcemanager.cluster-id' => 'hdp_demo',
        'yarn.nodemanager.local-dirs' => '/hadoop/yarn/local',
        'yarn.nodemanager.log-dirs' => '/hadoop/yarn/log',
        'yarn.timeline-service.leveldb-state-store.path' => '/hadoop/yarn/timeline',
        'yarn.timeline-service.leveldb-timeline-store.path' => '/hadoop/yarn/timeline',
      },
    },
    'user' => {
      'name' => 'yarn',
      'home' => '/home/yarn',
      'shell' => '/bin/bash',
      'uid' => '15029',
    },
  },
}

# -- HIVE --
default['hw']['hive'] = {
  'config' => {
    'hive-site' => {
      'javax.jdo.option.ConnectionPassword' => 'Welcome12345',
    },
  },
  'user' => {
    'name' => 'hive',
    'home' => '/home/hive',
    'shell' => '/bin/bash',
    'uid' => '15017',
  },
}

# -- KAFKA --
default['hw']['kafka'] = {
  'config' => {
    'kafka-broker' => {
      'auto.create.topics.enable' => 'true',
      'default.replication.factor' => '2',
      'delete.topic.enable' => 'false',
      'log.dirs' => '/kafka-logs',
      'log.retention.hours' => '-1',
      'num.partitions' => '3',
    },
  },
  'user' => {
    'name' => 'kafka',
    'home' => '/home/kafka',
    'shell' => '/bin/bash',
    'uid' => '15019',
  },
}

# -- OOZIE --
default['hw']['oozie'] = {
  'config' => {
    'oozie-site' => {
      'oozie.service.JPAService.jdbc.password' => 'Welcome12345',
    },
  },
  'lib' => {
    'sqoop' => {
      'jars_install' => {
        'jtds' => {
          'name' => 'jtds-1.3.1.jar',
          'source' => 'http://central.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar',
          'checksum' => 'aac05ebf5504c91b29420129b02dd878a86c52f8fa6eccf9235e0bfd7a60bef1',
        },
        'kite-data-core' => {
          'name' => 'kite-data-core-1.1.0.jar',
          'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-core/1.1.0/kite-data-core-1.1.0.jar',
          'checksum' => '0fa00b157ef861138a9f45752da9e7b75f4b492870ca5e4061337437d64199ad',
        },
        'kite-data-hive' => {
          'name' => 'kite-data-hive-1.1.0.jar',
          'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-hive/1.1.0/kite-data-hive-1.1.0.jar',
          'checksum' => 'f13ce2d0006dc6ab2e1892f44c1c0cdd372883c98563437504b52b0bb08c55a7',
        },
        'kite-data-mapreduce' => {
          'name' => 'kite-data-mapreduce-1.1.0.jar',
          'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-data-mapreduce/1.1.0/kite-data-mapreduce-1.1.0.jar',
          'checksum' => '76776802fa23a3263802cc8f6b22016498aa07b342af50a46673e7ecd022cbdf',
        },
        'kite-hadoop-compatibility' => {
          'name' => 'kite-hadoop-compatibility-1.1.0.jar',
          'source' => 'http://central.maven.org/maven2/org/kitesdk/kite-hadoop-compatibility/1.1.0/kite-hadoop-compatibility-1.1.0.jar',
          'checksum' => '09cdf5a839c3e21283adf2acf9ea01d9e307e5ddbda93061f6bca24719578b3d',
        },
      },
      'jars_remove' => [
        'kite-data-core-1.0.0.jar',
        'kite-data-hive-1.0.0.jar',
        'kite-data-mapreduce-1.0.0.jar',
        'kite-hadoop-compatibility-1.0.0.jar',
      ],
    },
  },
  'user' => {
    'name' => 'oozie',
    'home' => '/home/oozie',
    'shell' => '/bin/bash',
    'uid' => '15024',
  },
}

# -- SMARTSENSE --
default['hw']['smartsense'] = {
  'config' => {
    'activity-zeppelin-shiro' => {
      'users.admin' => 'admin',
    },
  },
}

# -- STORM --
default['hw']['storm'] = {
  'user' => {
    'name' => 'storm',
    'home' => '/home/storm',
    'shell' => '/bin/bash',
    'uid' => '15028',
  },
}

# -- ZOOKEEPER --
default['hw']['zookeeper'] = {
  'config' => {
    'zoo.cfg' => {
      'dataDir' => '/hadoop/zookeeper',
    },
  },
  'user' => {
    'name' => 'zookeeper',
    'home' => '/home/zookeeper',
    'shell' => '/bin/bash',
    'uid' => '15025',
  },
}
