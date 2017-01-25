name 'hdp-chef'
maintainer 'Ryan Hansohn'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures hdp-chef'
long_description 'Installs/Configures hdp-chef'
version '1.3.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/hdp-chef/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/hdp-chef' if respond_to?(:source_url)

depends 'hostsfile'
depends 'java', '~> 1.42.0'
depends 'sysctl'
depends 'ulimit'
