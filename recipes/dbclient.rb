#
# Cookbook:: nopcommerce
# Recipe:: dbclient.rb
# Author:: Michael Ducy (<michael@chef.io>)
#
# Copyright:: 2014-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Recipe.send(:include, Windows::Helper)

dbserver = search('node', "role:#{node['nopcommerce']['dbserver_role']} AND chef_environment:#{node.chef_environment}").first['ipaddress'] || []

settings_template = win_friendly_path(::File.join(node['nopcommerce']['approot'], 'nopCommerce', 'App_Data\\Settings.txt'))

template settings_template do
  source 'Settings.txt.erb'
  action :create
  rights :modify, 'IIS_IUSRS'
  variables(
    dbuser: node['nopcommerce']['dbuser'],
    dbpassword: node['nopcommerce']['dbpassword'],
    dbserver: dbserver || node['nopcommerce']['dbserver']
  )
end

plugins_file = win_friendly_path(::File.join(node['nopcommerce']['approot'], 'nopCommerce', 'App_Data\\InstalledPlugins.txt'))

file plugins_file do
  action :create
  rights :modify, 'IIS_IUSRS'
end
