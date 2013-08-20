name             'nopcommerce'
maintainer       'Opscode, Inc.'
maintainer_email 'jdunn@opscode.com'
license          'Apache 2.0'
description      'Installs/Configures nopCommerce'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{iis windows}.each do |d|
  depends d
end

supports 'windows'
