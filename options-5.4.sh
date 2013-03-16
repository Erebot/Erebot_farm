#!/bin/sh

configoptions="\
$configoptions \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--with-sqlite3=shared \
--with-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
"

