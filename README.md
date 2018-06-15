# hdp-chef

This cookbook utilizes [Apache Ambari](https://ambari.apache.org/) to install [Hortonworks Data Platform](https://hortonworks.com/products/data-platforms/hdp/) and provision [Hadoop](http://hadoop.apache.org/) clusters using [Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints).

### Prerequsites

HDP requires the
[Ambari](https://ambari.apache.org/), [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html), and [Python](https://www.python.org/) as prerequisites for installation. These prerequisites can be fulfilled using recipes found in the [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook or by any other means independently. You can include and customize these prerequisites by modifying the following.

##### recipes

```ruby
# ambari-server
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# ambari-agent
include `ambari-chef::ambari_agent_prerequisites`
include 'ambari-chef::ambari_agent'
```

##### attributes

```ruby
# python 2
default['python']['python2']['packages'] = ['python']

# java 8
default['java']['install_from'] = 'oracle_source'
default['java']['install_version'] = 'jdk-8u172-linux-x64'
```

### Configuration

By default this cookbook installs HDP version ```2.6.5```, which at the time of this writing, is the current version. A different version of HDP can be specified for installation by overriding the version attribute.

```ruby
# hdp
default['hw']['hdp']['version'] = '2.6.5'
```

### Blueprints

Blueprints allow hdp clusters to be programmatically provisioned. A sample `hdp_demp` blueprint has been included with this cookbook and includes the following applications.

- [hdfs](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html)
- [yarn](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html)
- [mapreduce](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html)
- [slider](https://slider.incubator.apache.org/)
- [zookeeper](https://zookeeper.apache.org/)
- [ambari infra](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-operations/content/ch_ambari_infra.html)
- [ambari metrics](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-operations/content/ch_using_ambari_metrics.html)
- [ambari logsearch](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-operations/content/ch_ambari_log_search.html)

You can create your own blueprints and modify the following to push them out with this cookbook

##### recipes

```ruby
# hdp cluster
include 'hdp-chef::hdp_cluster'
```

##### attributes

```ruby
# hortonworks hdp cluster
default['hw']['hdp']['version'] = '2.6.5'
default['hw']['hdp']['cluster']['name'] = 'hdp_demo'
default['hw']['hdp']['cluster']['blueprint_name'] = 'hdp_demo_2.6.5_blueprint'
default['hw']['hdp']['cluster']['blueprint_file'] = 'hdp_demo_2.6.5_blueprint.json'
default['hw']['hdp']['cluster']['hostmapping_file'] = 'hdp_demo_2.6.5_hostmapping.json'
```

### Usage

To install HDP, include the `hdp` recipe in your run list. Unless independently handling the perquisites yourself, include the recipes provided by the `ambari-chef` cookbook as well.

```ruby
# include prerequisites
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# include hdp
include 'hdp-chef::hdp'
include 'hdp-chef::hdp_cluster'
```

Once installed, log into Ambari at http://127.0.0.1:8080 using `admin` for both the username and password. The `hdp_demo` cluster will automatically provision using the included blueprint.

### Documentation

The following resources may be helpful to better understand HDP:

- [Apache Ambari](https://ambari.apache.org/)
- [Apache Ambari Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints)
- [Hortonworks Documentation](https://docs.hortonworks.com/index.html)
- [Hortonworks Community](https://community.hortonworks.com/answers/index.html)
