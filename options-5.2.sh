#!/bin/sh

configoptions="\
$configoptions \
--enable-simplexml \
--enable-cli \
--enable-cgi \
--enable-sqlite-utf8 \
--enable-zend-multibyte \
--with-pcre-regex \
--enable-spl=shared \
--enable-reflection=shared \
--enable-fastcgi \
--enable-force-cgi-redirect \
"

