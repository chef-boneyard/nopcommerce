#
# Cookbook Name:: dotnet_demo
# Recipe:: default
#
# Copyright (C) 2013 Opscode, Inc.
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

# Install nopCommerce pre-requisites without using WebPI.

windows_feature 'IIS-WebServerRole' do
  action :install
end

# Some pre-requisite features for IIS-ASPNET that need to be installed first, in this order!
%w{IIS-ISAPIFilter IIS-ISAPIExtensions NetFx3ServerFeatures NetFx3 NetFx4Extended-ASPNET45 IIS-NetFxExtensibility}.each do |f|
  windows_feature f do
    action :install
  end
end

windows_feature 'IIS-ASPNET' do
  action :install
end

# Pre-requisites for IIS-ASPNET45
windows_feature 'IIS-NetFxExtensibility45' do
  action :install
end

windows_feature 'IIS-ASPNET45' do
  action :install
end

service "iis" do
  service_name "W3SVC"
  action :nothing
end

include_recipe "iis::remove_default_site"

windows_zipfile node['nopcommerce']['approot'] do
  source node['nopcommerce']['dist']
  action :unzip
  not_if {::File.exists?(::File.join(node['nopcommerce']['approot'], "nopCommerce"))}
end

# Grant modify access to IIS_IUSRS to the following directories per the
# documentation:
#    \App_Data\
#    \bin\
#    \Content\
#    \Content\Images\
#    \Content\Images\Thumbs\
#    \Content\Images\Uploaded\
#    \Content\files\ExportImport\
#    \Plugins\
#    \Plugins\bin\
#    \Global.asax
#    \web.config

%w{App_Data bin Content Content\\Images Content\\Images\\Thumbs Content\\Images\\Uploaded Content\\files\\ExportImport Plugins Plugins\\bin}.each do |d|
  directory ::File.join(node['nopcommerce']['approot'], 'nopCommerce', d) do
    rights :modify, 'IIS_IUSRS'
  end
end

%w{Global.asax web.config}.each do |f|
  file ::File.join(node['nopcommerce']['approot'], 'nopCommerce', f) do
    rights :modify, 'IIS_IUSRS'
  end
end

iis_pool node['nopcommerce']['poolname'] do
  runtime_version "4.0"
  action :add
end

directory node['nopcommerce']['siteroot'] do
  rights :read, 'IIS_IUSRS'
  recursive true
  action :create
end

iis_site 'nopCommerce' do
  protocol :http
  port 80
  path node['nopcommerce']['siteroot']
  action [:add,:start]
end

iis_app 'nopCommerce' do
  application_pool node['nopcommerce']['poolname']
  physical_path ::File.join(node['nopcommerce']['approot'], 'nopCommerce')
  action :add
end
