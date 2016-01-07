# installs php and extensions
include_recipe "raven-php::install_php"

# configures custom php ini settings
include_recipe "raven-php::configure_php"

# installs php composer
include_recipe "raven-php::install_composer"
