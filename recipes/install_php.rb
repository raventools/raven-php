
case node[:platform_family]
when "rhel"

	package "php55u-common" do
		action :remove
	end

	package "php56u"

	%w(	php56u-gd
		php56u-mysql
		php56u-xml
		php56u-pecl-redis
		php56u-pear
		php56u-mbstring
	  ).each do |p|
		package p
	end

when "debian"

# TODO

end
