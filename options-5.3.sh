#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config54.diff
patch -r - -N -p1 < ../custom/patch-openssl-php53.diff
PHP_AUTOCONF=autoconf ./buildconf --force
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

