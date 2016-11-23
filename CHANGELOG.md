# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased](unreleased)

- no new features in development at this time

## [0.4.0](https://github.com/audio4ears/hdp-chef/compare/v0.4.0...v0.3.0) (Nov 23, 2016)

FEATURES:

- add inspec tests

## [0.3.0](https://github.com/audio4ears/hdp-chef/compare/v0.3.0...v0.2.1) (Nov 22, 2016)

FEATURES:

- add ambari-agent recipes
- update chef-client to 12.16.42
- use seperate user accounts for ambari-server and ambari-agent

BUG FIXES:

- fixed jce download url
- fixed minor syntax errors

KNOWN ISSUES:

- encryption not functional yet

## [0.2.1](https://github.com/audio4ears/hdp-chef/compare/v0.2.1...v0.2.0) (Nov 9, 2016)

BUG FIXES:

- update metadata.rb with new version

## [0.2.0](https://github.com/audio4ears/hdp-chef/compare/v0.2.0...v0.1.0) (Nov 8, 2016)

FEATURES:

- add custom ambari-server systemd service
- add custom ambari.properties config

## [0.1.0](https://github.com/audio4ears/hdp-chef/compare/v0.1.0...v0.1.0) (Oct 24, 2016)

FEATURES:

- initial commit
- converges centos 7.2 box running hdp 2.5.0 with default installation parameters

KNOWN ISSUES:

- custom ambari-server systemd service not used
- custom ambari.properties config not used
