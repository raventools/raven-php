name             'raven-php'
maintainer       'Sitening LLC'
maintainer_email 'phil@raventools.com'
license          'MIT'
description      'Manage php installation and configuration'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

depends "raven-deploy"

recipe "raven-php::default", "installs everything"
recipe "raven-php::install_php", "installs php"
recipe "raven-php::configure_php", "configures php"
recipe "raven-php::install_composer", "installs composer"
recipe "raven-php::install_phpunit", "installs phpunit"
recipe "raven-php::install_devtools", "installs dev and build tools"

attribute "raven_php",
    :display_name => "Raven PHP",
    :type => "hash"

attribute "raven_php/composer/owner",
    :display_name => "Composer directory owner",
    :description => "Composer directory owner",
    :required => "recommended",
	:default => "root",
    :type => "string",
    :recipes => ["raven-php::install_composer"]

attribute "raven_php/composer/group",
    :display_name => "Composer directory group",
    :description => "Composer directory groyp",
    :required => "recommended",
	:default => "root",
    :type => "string",
    :recipes => ["raven-php::install_composer"]
