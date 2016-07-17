#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config54.diff && \
patch -r - -N -p1 < ../custom/patch-openssl-php53.diff && \
patch -r - -N -p1 < ../custom/patch-openssl10-php53.diff && \
if [ $? -eq 0 ]; then
    PHP_AUTOCONF=autoconf2.59 ./buildconf --force
    make distclean
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

