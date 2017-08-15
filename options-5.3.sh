#!/bin/bash

pushd "php-$1"
echo "Applying ICU patch"
patch -r - -N -p1 < ../custom/icu-pkg-config54.diff
echo "Applying OpenSSL 1.0+ compatibility patch"
patch -r - -N -p1 < ../custom/patch-openssl10-php53.diff
echo "Applying OpenSSL linking patch"
patch -r - -N -p1 < ../custom/patch-openssl-php53.diff
if [ $? -eq 0 ]; then
    PHP_AUTOCONF=autoconf2.59 ./buildconf --force
fi
popd

configoptions="\
$configoptions \
--enable-simplexml=shared \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--enable-sqlite-utf8 \
--enable-zend-multibyte \
--with-sqlite3 \
--with-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--enable-ucd-snmp-hack \
"

