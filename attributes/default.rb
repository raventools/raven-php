default[:raven_php][:fastcgi_socket] = "/var/run/php_fpm/php_fpm.sock"

normal[:mod_php5_apache2][:packages] = []

default[:raven_php][:composer][:owner] = "root"
default[:raven_php][:composer][:group] = "root"
default[:raven_php][:satis][:hostname] = "ravenapp-composer.raventools.com"
default[:raven_php][:satis][:username] = ""
default[:raven_php][:satis][:password] = ""
