bash "install-composer" do
    code <<-EOH
    curl -sS https://getcomposer.org/installer | php -d allow_url_fopen=On
    mv composer.phar /usr/bin/composer
    EOH
	not_if { File.exists?("/usr/bin/composer") }
end

bash "update-composer" do
    code <<-EOH
    php -d allow_url_fopen=On /usr/bin/composer self-update
    EOH
	only_if { File.exists?("/usr/bin/composer") }
end

# set up auth credentials for our local satis mirror
directory "/var/lib/composer" do
    owner node[:raven_php][:composer][:owner]
    group node[:raven_php][:composer][:group]
end
file "/var/lib/composer/auth.json" do
    content JSON.generate({
                "http-basic" => {
                    "#{node[:raven_php][:satis][:hostname]}" => {
                        "username" => node[:raven_php][:satis][:username],
                        "password" => node[:raven_php][:satis][:password]
                    }
                }
            })
end