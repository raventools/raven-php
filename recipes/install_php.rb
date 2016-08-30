
case node[:platform_family]
when "rhel"

	package "php55u-common" do
		action :remove
	end

	package "php56u"

	%w(	php56u-gd
		php56u-mysql
		php56u-xml
		php56u-pear
		php56u-mbstring
		php56u-gmp
		php56u-pecl-redis
		php56u-pecl-memcached
		php56u-pecl-yaml
		php56u-xmlrpc
		php56u-soap
	  ).each do |p|
		package p
	end

when "debian"

# TODO

end
