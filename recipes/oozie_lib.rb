#
# Cookbook:: hdp-chef
# Recipe:: oozie_lib
#
# The MIT License (MIT)
#
# Copyright:: 2018, Ryan Hansohn
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

hdp_version_full = -> { node['hw']['hdp'][node['hw']['hdp']['version']]['version_full'] }

# create oozie lib dir
directory "create_/usr/hdp/#{hdp_version_full.call}/oozie" do
  path "/usr/hdp/#{hdp_version_full.call}/oozie"
  recursive true
  action :create
end

directory "create_/usr/hdp/#{hdp_version_full.call}/oozie/share/lib" do
  path "/usr/hdp/#{hdp_version_full.call}/oozie/share/lib"
  recursive true
  owner node['hw']['oozie']['user']['name']
  group node['hw']['hadoop']['common']['group']['name']
  action :create
end

# applications - itterate though applications
node['hw']['oozie']['lib'].each do |app_name, app_conf|
  # create app directory
  directory "create_/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}" do
    path "/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}"
    owner node['hw']['oozie']['user']['name']
    group node['hw']['hadoop']['common']['group']['name']
    action :create
  end

  # jars - remove undesired jars
  app_conf['jars_remove'].each do |jar_name|
    file "delete_/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}/#{jar_name}" do
      path "/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}/#{jar_name}"
      action :delete
    end
  end

  # jars - download desired jars
  app_conf['jars_install'].each do |_jar_name, jar_meta|
    # jars - download desired jars
    remote_file "download_/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}/#{jar_meta['name']}" do
      source jar_meta['source'].to_s
      checksum jar_meta['checksum'].to_s
      path "/usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}/#{jar_meta['name']}"
      owner node['hw']['oozie']['user']['name']
      group node['hw']['hadoop']['common']['group']['name']
    end
  end
end

# applications - itterate though applications
node['hw']['oozie']['lib'].each do |app_name, _app_conf|
  # copy jars to hdfs
  bash "copy_oozie_#{app_name}jars_to_hdfs" do
    code <<-EOF
      hdfs dfs -put /usr/hdp/#{hdp_version_full.call}/oozie/share/lib/#{app_name}/*.jar /user/oozie/share/lib/lib_*/#{app_name}/
      hdfs dfs -chown -R #{node['hw']['oozie']['user']['name']}:#{node['hw']['hadoop']['common']['group']['name']} /user/oozie/share/lib/lib_*/#{app_name}
      hdfs dfs -chmod 644 /user/oozie/share/lib/lib_*/#{app_name}/*.jar
    EOF
    user node['hw']['hadoop']['hdfs']['user']['name']
    action :nothing
  end
end
