#
# Cookbook Name:: nopcommerce
# Recipe:: database
# Author:: Julian C. Dunn (<jdunn@chef.io>)
#
# Copyright (C) 2013-2015 Chef Software, Inc.
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

# XXX Future work.
#
# There's a settings file in App_data called Settings.txt
#
# Looks like:
# DataProvider: sqlserver
# DataConnectionString: Data Source=givkhha4h7.database.windows.net;Initial Catalog=nopcommerce;Integrated Security=False;Persist Security Info=False;User ID=opscode;Password=P@ssword1;MultipleActiveResultSets=True

# There's also a create_required_data.sql in App_data\install

# There's also some index creation and stored procedure scripts in App_data

# Setup also creates an InstalledPlugins file in App_data, looks like that in ../files
