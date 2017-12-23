#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/icu-pkg-config.diff
if [ $? -eq 0 ]; then
    PHP_AUTOCONF=autoconf ./buildconf --force
    touch --reference=buildconf configure
fi
popd

configoptions="\
$configoptions \
--enable-simplexml=shared \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--with-sqlite3 \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-libzip \
--with-password-argon2 \
--enable-opcache=shared \
--enable-fpm \
--enable-phpdbg \
--enable-gcc-global-regs \
"

