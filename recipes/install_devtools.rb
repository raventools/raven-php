package "phar-composer" do
	version "1.0.0-1"
end

file "/usr/bin/build_php_artifact" do
	mode 0755
	content <<-EOH
#!/bin/bash

prefix=$1
composer_json=$2
outdir=`readlink -f "$3"`

tmpdir=`mktemp -d`

cp "$composer_json" "$tmpdir"

pushd "$tmpdir"
COMPOSER_HOME=/var/lib/composer composer install
checksum=`md5sum $composer_json | cut -d' ' -f1`
tar -c vendor > "${outdir}/${prefix}-${checksum}.tar" 
popd

rm -rf $tmpdir

#vim:set ft=sh:
	EOH
end
