
case node[:platform_family]
when "rhel"

	webtatic_path = "#{node[:attachment_dir]}/webtatic.rpm"

	remote_file webtatic_path do
		source "https://mirror.webtatic.com/yum/el6/latest.rpm"
		notifies :install, "rpm_package[webtatic-repo]", :immediately
		not_if { ::File.exists?("/etc/yum.repos.d/webtatic.repo") }
	end

	rpm_package "webtatic-repo" do
		action :nothing
		source webtatic_path
	end

	package "php56w"

	%w(	php56w-gd
		php56w-curl
		php56w-mysql
		php56w-xml
		php56w-pecl-redis
		php-pear
	  ).each do |p|
		package p
	end

when "debian"

# TODO

end
