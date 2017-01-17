#
# Cookbook:: nopcommerce
# Recipe:: dbserver.rb
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

registry_key 'LoginMode' do
  key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Microsoft SQL Server\\MSSQL12.MSSQLSERVER2000\\MSSQLServer'
  values [{
    name: 'LoginMode',
    type: :dword,
    data: 2,
  }]
  notifies :restart, 'service[MSSQLSERVER]'
end

service 'MSSQLSERVER' do
  action :nothing
end

zippath = win_friendly_path(::File.join('c:\\', node['nopcommerce']['sqlfile']))

windows_zipfile zippath do
  source node['nopcommerce']['sqlzip']
  action :unzip
  not_if { ::File.exist?(::File.join(zippath, node['nopcommerce']['sqlfile'])) }
end

db_lock = win_friendly_path(::File.join(zippath, 'nopcom.lock'))

sql_file = win_friendly_path(::File.join(zippath, node['nopcommerce']['sqlfile']))

powershell_script 'loadDB' do
  code <<-EOF
Import-Module sqlps

Invoke-Sqlcmd -Username #{node['nopcommerce']['dbuser']} -Password #{node['nopcommerce']['dbpassword']} -InputFile #{sql_file}
  EOF
  flags '-ExecutionPolicy Unrestricted '
  notifies :create, "file[#{db_lock}]"
  not_if { ::File.exist?(db_lock) }
end

file db_lock do
  action :nothing
end
