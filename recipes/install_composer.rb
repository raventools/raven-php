include_recipe "raven-deploy"

package "composer" do
	version "1.0-1"
end

bash "update-composer" do
    code <<-EOH
    php -d allow_url_fopen=On /usr/bin/composer self-update --1
    EOH
	only_if { File.exists?("/usr/bin/composer") }
end

# set up auth credentials for our local satis mirror
directory "/var/lib/composer" do
    owner node[:raven_php][:composer][:owner]
    group node[:raven_php][:composer][:group]
end
