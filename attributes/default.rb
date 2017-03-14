default[:raven_php][:fastcgi_socket] = "/var/run/php_fpm/php_fpm.sock"

normal[:mod_php5_apache2][:packages] = []

default[:raven_php][:composer][:owner] = "root"
default[:raven_php][:composer][:group] = "root"
default[:raven_php][:satis][:hostname] = "ravenapp-composer.raventools.com"
default[:raven_php][:satis][:username] = ""
default[:raven_php][:satis][:password] = ""

default[:raven_php][:xdebug][:default_enable] = 0
default[:raven_php][:xdebug][:idekey] = "vagrant"
default[:raven_php][:xdebug][:remote_enable] = 0
default[:raven_php][:xdebug][:remote_autostart] = 0
default[:raven_php][:xdebug][:remote_connect_back] = 0
default[:raven_php][:xdebug][:remote_port] = 9000
default[:raven_php][:xdebug][:remote_handler] = "dbgp"
default[:raven_php][:xdebug][:remote_log] = "/var/log/xdebug.log"
default[:raven_php][:xdebug][:remote_host] = "10.0.2.2"


default[:raven_php][:php_conf] = ["date.timezone = US/Eastern","memory_limit = 128M","allow_url_fopen=1","expose_php = off"]
