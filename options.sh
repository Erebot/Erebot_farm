#!/bin/bash

pushd "php-$1"
patch -r - -N -p1 < ../custom/core-constants.diff
# Update build-defs.h.in if needed,
# and force a full recompilation if we do update it.
test -n "$(cp -uvf ../custom/build-defs.h.in main/)"
popd

if [ "$ARCH" = "i386" ]; then
    gmp_dir="/usr/include/`dpkg-architecture -A $ARCH -qDEB_TARGET_MULTIARCH`/"
else
    gmp_dir="/usr/include/`dpkg-architecture -qDEB_TARGET_MULTIARCH`/"
fi

configoptions="\
--disable-all \
--disable-short-tags \
--disable-sigchild \
--with-layout=GNU \
--with-regex \
--with-openssl=shared \
--with-zlib=shared \
--enable-bcmath=shared \
--with-bz2=shared \
--enable-calendar=shared \
--with-gettext=shared \
--enable-mbstring=shared \
--enable-pcntl=shared \
--enable-sockets=shared \
--with-pdo-sqlite \
--enable-sysvmsg=shared \
--enable-sysvsem=shared \
--enable-sysvshm=shared \
--with-xsl=shared \
--with-iconv=shared \
--enable-zip=shared \
--enable-posix=shared \
--enable-libxml=shared \
--enable-dom=shared \
--enable-xml=shared \
--enable-xmlreader=shared \
--enable-xmlwriter=shared \
--enable-tokenizer=shared \
--enable-pdo \
--enable-ctype=shared \
--enable-json=shared \
--enable-session=shared \
--enable-soap=shared \
--enable-filter \
--with-gmp=shared,$gmp_dir \
--with-readline \
--disable-mysqlnd-compression-support \
"
