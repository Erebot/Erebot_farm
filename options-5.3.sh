#!/bin/sh

configoptions="\
$configoptions \
--enable-hash \
--enable-intl=shared \
--enable-phar=shared \
--enable-sqlite-utf8 \
--enable-zend-multibyte \
--with-sqlite3=shared \
--with-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
"

