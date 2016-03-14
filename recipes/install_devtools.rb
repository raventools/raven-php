package "phar-composer" do
	version "1.0.0-1"
end

cookbook_file "/usr/bin/build_php_artifact" do
	mode 0755
	source "build_php_artifact"
end
