CHANGELOG
=========

This file is used to list changes made in each version of the nopcommerce cookbook.

## 1.0.1 (2017-04-26)

- Cookstyle fixes
- Test with Delivery Local Mode
- Update apache2 license string

## 1.0.0 (2016-09-16)

- Testing updates
- Require Chef 12.1

0.1.3 (2015-11-18)
------------------------
- Added Apache 2.0 license file
- Added Rakefile for simplified testing
- Updated contributing, testing, and maintainers docs
- Opscode -> Chef Software
- Added .gitignore and chefignore files
- Added a Rubocop config and resolved all warnings
- Added new issues_url and source_url metadata
- Disabled foodcritic FC003 with a .foodcritic file
- Added a Travis config for testing
- Added a Berksfile
- Updated Readme format and added travis and cookbook version badge

0.1.2
-----
- Bakh Inamov (bakh@chef.io) - removed 7-zip due to windows cookbook >= 1.11.0
- now ec2-compatible, but not exclusive
- using Opscode's dropbox to host nopcommerce_data.zip

0.1.1
-----
- Bakh Inamov (<bakh@chef.io>) - Works on AWS EC2 and has a demo recipe.

0.1.0
-----
- Julian C. Dunn (<jdunn@chef.io>) - Initial release of nopcommerce
