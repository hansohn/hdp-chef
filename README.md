# hdp-chef

This cookbook utilizes [Apache Ambari](https://ambari.apache.org/) to install [Hortonworks Data Platform](http://hortonworks.com/products/hdp/).

### Prerequsites

- `python:` `2.7`
- `java:` `jdk-8u77-linux-x64`

### Installation

By default, Ambari version ```2.4.1``` and HDP version ```2.5.0``` are installed. A different version of HDP can be specified for installation by overriding the version attribute:

```ruby
default['hdp']['version'] = '2.5.0'
```

### Documentation

The following resources may be helpful to better understand Ambari & HDP usage:

- [Apache Ambari](https://ambari.apache.org/)
- [Hortonworks Documentation](https://docs.hortonworks.com/index.html)
- [Hortonworks Community](https://community.hortonworks.com/answers/index.html)
