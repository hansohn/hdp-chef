# hdp-chef

This cookbook utilizes [Apache Ambari](https://ambari.apache.org/) to install [Hortonworks Data Platform](http://hortonworks.com/products/hdp/).

### Prerequsites

- `python:` `2.7`
- `java:` `jdk-8u77-linux-x64`

### Installation

By default, Ambari version ```2.4.1``` and HDP version ```2.5.0``` are installed. A different version of Ambari or HDP can be specified for installation by overriding the version attribute.

```ruby
default['hw']['ambari']['version'] = '2.4.1'
default['hw']['hdp']['version'] = '2.5.0'
```

Due to general issues with nested attributes, application versions must have case statement translation within the default attribute file. Currently only Ambari version ```2.4.1``` and HDP versions ```2.4.3``` and ```2.5.0``` are supported.

### Documentation

The following resources may be helpful to better understand Ambari & HDP usage:

- [Apache Ambari](https://ambari.apache.org/)
- [Apache Ambari Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints)
- [Hortonworks Documentation](https://docs.hortonworks.com/index.html)
- [Hortonworks Community](https://community.hortonworks.com/answers/index.html)
