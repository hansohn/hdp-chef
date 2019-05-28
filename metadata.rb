name 'hdp-chef'
maintainer 'Ryan Hansohn'
maintainer_email 'info@imnorobot.com'
license 'MIT'
description 'Installs/Configures hdp-chef'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.2.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
source_url 'https://github.com/hansohn/hdp-chef' if respond_to?(:source_url)
issues_url 'https://github.com/hansohn/hdp-chef/issues' if respond_to?(:issues_url)

supports 'centos', '>= 7.0'

depends 'ambari-chef'
depends 'hostsfile'
depends 'java-chef'
depends 'ulimit'
