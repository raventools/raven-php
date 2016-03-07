include_recipe "raven-deploy"

package "composer" do
	version "1.0-1"
end

bash "update-composer" do
    code <<-EOH
    php -d allow_url_fopen=On /usr/bin/composer self-update
    EOH
	only_if { File.exists?("/usr/bin/composer") }
end

ruby_block "fetch composer auth" do
	block do

		begin

			# use data bag item if available
			composer_auth = Chef::EncryptedDataBagItem.load("composer", "auth").to_hash

		rescue Exception => ex

			# otherwise, fall back to chef attributes
			composer_auth = {
				"username" => node[:raven_php][:satis][:username],
				"password" => node[:raven_php][:satis][:password]
			}
		end

		# modifies the file resource below during runtime to include the correct auth info
		resources("file[/var/lib/composer/auth.json]").content JSON.generate({
			"http-basic" => {
				"#{node[:raven_php][:satis][:hostname]}" => composer_auth
			}
		})

	end
end

# set up auth credentials for our local satis mirror
directory "/var/lib/composer" do
    owner node[:raven_php][:composer][:owner]
    group node[:raven_php][:composer][:group]
end

file "/var/lib/composer/auth.json"
