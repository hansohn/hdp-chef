# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased](unreleased)

- no new features in development at this time

## [2.2.0](https://github.com/hansohn/hdp-chef/compare/2.1.0...2.2.0) (May 27, 2019)

FEATURES:

- bump ambari version to 2.7.3
- bump java version to 1.8.0_212 

## [2.1.0](https://github.com/hansohn/hdp-chef/compare/2.0.0...2.1.0) (Jul 19, 2018)

FEATURES:

- bump ambari version to 2.7.0
- bump java version to 1.8.0_181 
- add version definition file support
- update license
- update tests

BUG FIXES:

- resolve issue where hdp version attribute is not intrepreted correctly when defined externally

## [2.0.0](https://github.com/hansohn/hdp-chef/compare/1.2.0...2.0.0) (Jun 19, 2018)

FEATURES:

- seperated out ambari recipes into [ambari-chef](https://github.com/hansohn/ambari-chef) cookbook
- seperated out hdf recipes into [hdf-chef](https://github.com/hansohn/hdf-chef) cookbook
- updated hdp default version to 2.6.5
- added lint, inspec, and travis to ci pipeline
- refactor attributes

## [1.2.0](https://github.com/hansohn/hdp-chef/compare/1.1.0...1.2.0) (Jan 5, 2017)

FEATURES:

- added HDF components

## [1.1.0](https://github.com/hansohn/hdp-chef/compare/1.0.0...1.1.0) (Nov 29, 2016)

FEATURES:

- create ambari postgres database prior to running ambari-server setup
- allow custom jdbc_user_password password value

## [1.0.0](https://github.com/hansohn/hdp-chef/compare/0.4.0...1.0.0) (Nov 28, 2016)

BREAKING CHANGES:

- update attribute hash structure

FEATURES:

- add ambari version attribute

## [0.4.0](https://github.com/hansohn/hdp-chef/compare/0.3.0...0.4.0) (Nov 23, 2016)

FEATURES:

- add inspec tests
- update sudoers files for solr and log search
- increase mem & cpu resource allocation in kitchen.yml

## [0.3.0](https://github.com/hansohn/hdp-chef/compare/0.2.1...0.3.0) (Nov 22, 2016)

FEATURES:

- add ambari-agent recipes
- update chef-client to 12.16.42
- use seperate user accounts for ambari-server and ambari-agent

BUG FIXES:

- fixed jce download url
- fixed minor syntax errors

KNOWN ISSUES:

- encryption not functional yet

## [0.2.1](https://github.com/hansohn/hdp-chef/compare/0.2.0...0.2.1) (Nov 9, 2016)

BUG FIXES:

- update metadata.rb with new version

## [0.2.0](https://github.com/hansohn/hdp-chef/compare/0.1.0...0.2.0) (Nov 8, 2016)

FEATURES:

- add custom ambari-server systemd service
- add custom ambari.properties config

## [0.1.0](https://github.com/hansohn/hdp-chef/compare/0.1.0...0.1.0) (Oct 24, 2016)

FEATURES:

- initial commit
- converges centos 7.2 box running hdp 2.5.0 with default installation parameters

KNOWN ISSUES:

- custom ambari-server systemd service not used
- custom ambari.properties config not used
