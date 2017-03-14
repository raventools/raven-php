
#
# generates php conf overrides

service "httpd" do
	supports :reload => true
	action :nothing
end

template "/etc/php.d/custom.ini" do
	source "php.ini.erb"
	user "root"
	mode 0644
	variables ({
		:parameters => node[:raven_php][:php_conf]
	})
	notifies :reload, "service[httpd]", :delayed
end
