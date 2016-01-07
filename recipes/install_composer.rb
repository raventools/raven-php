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
