#!/bin/sh

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config.diff
PHP_AUTOCONF=autoconf ./buildconf --force
popd

configoptions="\
$configoptions \
--enable-simplexml=shared \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--with-sqlite3 \
--with-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--enable-opcache=shared \
--enable-fpm \
--enable-phpdbg \
"

