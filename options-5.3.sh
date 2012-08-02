#!/bin/sh

configoptions="\
$configoptions \
--enable-intl \
--enable-phar \
--enable-sqlite-utf8 \
--enable-zend-multibyte \
--with-sqlite3 \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
"

