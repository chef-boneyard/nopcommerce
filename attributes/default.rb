#
# Cookbook:: nopcommerce
# Attributes:: default
#
# Copyright:: 2013-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['nopcommerce']['dist'] = 'https://www.dropbox.com/s/2l5llea3rsm1uxx/nopcommerce.zip?dl=1'
default['nopcommerce']['demozip'] = 'https://dl.dropboxusercontent.com/u/14471872/nopcommerce_data.zip'

default['nopcommerce']['sqlfile'] = 'nopcom.sql'
default['nopcommerce']['sqlzip'] = 'https://www.dropbox.com/s/82a0d8gmdcmbm7d/nopcom.zip?dl=1'

# I like to isolate these away from the default, wwwroot
default['nopcommerce']['siteroot'] = "#{ENV['SYSTEMDRIVE']}\\inetpub\\sites\\nopCommerce"
default['nopcommerce']['approot'] = "#{ENV['SYSTEMDRIVE']}\\inetpub\\apps"
default['nopcommerce']['apppath'] = '/shop'
default['nopcommerce']['poolname'] = 'nopCommerce'

# credentials if using standalone SQL Server
default['nopcommerce']['dbuser'] = 'nopcom'
default['nopcommerce']['dbpassword'] = 'nopcom'
default['nopcommerce']['dbserver'] = 'windowsdb'
default['nopcommerce']['dbserver_role'] = 'nopcom_db'
