#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config71.diff
if [ $? -eq 0 ]; then
    PHP_AUTOCONF=autoconf2.59 ./buildconf --force
    touch --reference=buildconf configure
fi
popd

configoptions="\
$configoptions \
--enable-simplexml=shared \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--with-mcrypt=shared \
--with-sqlite3 \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-libzip \
--enable-opcache=shared \
--enable-fpm \
--enable-phpdbg \
--enable-gcc-global-regs \
"

