name             'raven-php'
maintainer       'Sitening LLC'
maintainer_email 'phil@raventools.com'
license          'MIT'
description      'Manage php installation and configuration'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

recipe "raven-php::default", "installs everything"
recipe "raven-php::install_php", "installs php"
recipe "raven-php::configure_php", "configures php"
recipe "raven-php::install_composer", "installs composer"
recipe "raven-php::install_phpunit", "installs phpunit"
