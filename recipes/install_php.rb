
case node[:platform_family]
when "rhel"

    remote_file "/tmp/webtatic.rpm" do
        source "https://mirror.webtatic.com/yum/el6/latest.rpm"
        notifies :install, "rpm_package[webtatic-repo]", :immediately
    end

    rpm_package "webtatic-repo" do
        action :nothing
        source "/tmp/webtatic.rpm"
    end

	package "php56w"

	directory "/etc/php5/conf.d" do
		recursive true
	end

	%w(	php56w-gd
		php56w-curl
		php56w-mysql
		php56w-xml
		php56w-redis
		php-pear
	  ).each do |p|
		package p
	end

when "debian"

# TODO

end
