name             'nopcommerce'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache 2.0'
description      'Installs and configures nopCommerce, the shopping cart software for ASP.NET'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

%w(iis windows).each do |d|
  depends d
end

supports 'windows'

source_url 'https://github.com/chef-cookbooks/nopcommerce'
issues_url 'https://github.com/chef-cookbooks/nopcommerce/issues'
chef_version '>= 12.1'
