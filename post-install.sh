echo "Installing the remaining packages/extensions"

if [ "$VMAJOR" -lt 7 ]; then
    curdir=`pwd`
    cd $2/pear/temp
    if [ ! -d "./php-profiler-extension-4.0.4" ]; then
        wget https://github.com/tideways/php-profiler-extension/archive/v4.0.4.tar.gz
        tar xzvf v4.0.4.tar.gz
        cd php-profiler-extension-4.0.4
        if [ -f Makefile ]; then
            make distclean
        fi
        $2/bin/phpize
        ./configure --with-php-config="$2/bin/php-config"
        make
        make install
    fi
    cd "$curdir"
fi

if [ "0$VMAJOR" -eq 5 -a "0$VMINOR" -eq 3 ]; then
    xdebug_ver=-2.2.7
else
    xdebug_ver=
fi

exts=" \
    pecl/xdebug$xdebug_ver \
"
#pecl/xhprof-beta \

#if [ "$ARCH" != "i386" ]; then
    if [ 0$VMAJOR -lt 7 ]; then
        # Newer versions only support PHP 7.0.0+
        # and the pear installer is too dumb to automatically
        # downgrade packages based on dependencies.
        raphf_ver=-1.1.2
        propro_ver=-1.0.2
        http_ver=-2.5.6
    else
        raphf_ver=
        propro_ver=
        http_ver=
    fi

    exts="$exts \
    pecl/raphf$raphf_ver \
    pecl/propro$propro_ver \
    pecl/pecl_http$http_ver \
    "
#fi

if [ "$VMAJOR.$VMINOR" = "5.4" -a "$ARCH" != "i386" ]; then
    exts="$exts \
    pecl/vld-beta \
    pecl/ssh2-beta \
    pecl/krb5 \
    "
fi

for pkg in $exts; do
    echo -n "Installing '$pkg'... "
    ( "$2/bin/pear" info $pkg &> /dev/null && echo "Already installed" ) || \
    ( "$2/bin/pear" install -os $pkg < /dev/null > /dev/null && echo "OK" )
done

exit 0
