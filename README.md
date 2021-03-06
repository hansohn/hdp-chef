# hdp-chef

[![Build Status](https://travis-ci.org/hansohn/hdp-chef.svg?branch=master)](https://travis-ci.org/hansohn/hdp-chef) [![GitHub tag](https://img.shields.io/github/tag/hansohn/hdp-chef.svg)](https://github.com/hansohn/hdp-chef)

This cookbook extends the [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook to install [Hortonworks Data Platform](https://hortonworks.com/products/data-platforms/hdp/) and provision [Hadoop](http://hadoop.apache.org/) clusters using [Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints).

### Prerequsites

HDP requires [Ambari](https://ambari.apache.org/), [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html), and [Python](https://www.python.org/) as prerequisites for installation. These prerequisites can be fulfilled using recipes found in the [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook or by any other means independently. You can include and customize these prerequisites by modifying the following.

```ruby
# -- INCLUDE COOKBOOKS --
# ambari-server
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# ambari-agent
include `ambari-chef::ambari_agent_prerequisites`
include 'ambari-chef::ambari_agent'
```

```ruby
# -- INCLUDE ATTRIBUTES --
# python 2
override['python'] = {
  'python2' => {
    'packages' => ['python'],
  },
}

# java 8
override['java'] = {
  'install_from' => 'amazon_source',
  'install_version' => 'jdk-8u232-linux-x64',
}
```

### Configuration

By default this cookbook installs HDP version ```3.1.4```. A different version of HDP can be specified for installation by overriding the version attribute.

```ruby
# hdp
override['hw']['hdp'] =
  'version' => '3.1.4',
}
```

### Blueprints

Blueprints allow hdp clusters to be programmatically provisioned. A sample `hdp_demo` blueprint has been included with this cookbook contains core Hadoop applications.

You can create your own blueprints and modify the following to push them out with this cookbook

```ruby
# -- INCLUDE ATTRIBUTES --
# hortonworks hdp cluster
override['hw']['hdp'] = {
  'version' => '3.1.4',
  'cluster' => {
    'name' => 'hdp_demo',
    'blueprint_name' => 'hdp_demo_3.1.4_blueprint',
    'blueprint_file' => 'hdp_demo_3.1.4_blueprint.json'
    'hostmapping_file' => 'hdp_demo_3.1.4_hostmapping.json'
  },
}
```

### Usage

To install HDP, include the `hdp` recipe in your run list. Unless independently handling the perquisites yourself, include the recipes provided by the `ambari-chef` cookbook as well.

```ruby
# include prerequisites
include 'ambari-chef::ambari_server_prerequisites'
include 'ambari-chef::ambari_server'

# include hdp
include 'hdp-chef::hdp'
include 'ambari-chef::ambari_cluster'
```

Once installed, log into Ambari at http://127.0.0.1:8080 using `admin` for both the username and password. The `hdp_demo` cluster will automatically provision using the included blueprint.

### Documentation

The following resources may be helpful to better understand HDP:

- [Apache Ambari](https://ambari.apache.org/)
- [Apache Ambari Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints)
- [Hortonworks Documentation](https://docs.hortonworks.com/index.html)
- [Hortonworks Community](https://community.hortonworks.com/answers/index.html)
