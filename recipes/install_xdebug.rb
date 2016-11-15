package "php56u-pecl-xdebug"

template "/etc/php.d/60-xdebug_config.ini" do
	source "xdebug_config.ini.erb"
	variables ({
			:default_enable => node[:raven_php][:xdebug][:default_enable],
			:idekey => node[:raven_php][:xdebug][:idekey],
			:remote_enable => node[:raven_php][:xdebug][:remote_enable],
			:remote_autostart => node[:raven_php][:xdebug][:remote_autostart],
			:remote_connect_back => node[:raven_php][:xdebug][:remote_connect_back],
			:remote_port => node[:raven_php][:xdebug][:remote_port],
			:remote_handler => node[:raven_php][:xdebug][:remote_handler],
			:remote_log => node[:raven_php][:xdebug][:remote_log],
			:remote_host => node[:raven_php][:xdebug][:remote_host]
			})
	notifies :restart, "service[httpd]", :delayed
end
