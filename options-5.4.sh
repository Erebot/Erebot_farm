#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config54.diff
PHP_AUTOCONF=autoconf ./buildconf --force
patch -r - -N -p1 < ../custom/mcrypt.diff
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
--enable-fpm \
"

