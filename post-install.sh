echo "Installing the remaining packages/extensions"

# Try to install Tideways' PHP profiler
curdir=`pwd`
cd $2/pear/temp
if [ ! -d "./php-profiler-extension-4.1.1" ]; then
    wget https://github.com/tideways/php-profiler-extension/archive/v4.1.1.tar.gz
    tar xzvf v4.1.1.tar.gz
    cd php-profiler-extension-4.1.1
    if [ -f Makefile ]; then
        make distclean
    fi
    $2/bin/phpize
    ./configure --with-php-config="$2/bin/php-config"
    make
    make install
fi
cd "$curdir"

# Install LibTomcrypt bindings
curdir=`pwd`
cd $2/pear/temp
if [ ! -f v0.2.3.tar.gz ]; then
    wget https://github.com/fpoirotte/tomcrypt/archive/v0.2.3.tar.gz
fi
echo -n "Installing 'pecl/tomcrypt'... "
( "$2/bin/pear" info pecl/tomcrypt &> /dev/null && echo "Already installed" ) || \
( "$2/bin/pear" install -os v0.2.3.tar.gz < /dev/null > /dev/null && echo "OK" )
cd "$curdir"


if [ "0$VMAJOR" -eq 5 -a "0$VMINOR" -eq 3 ]; then
    xdebug_ver=-2.2.7
else
    xdebug_ver=
fi

exts=" \
    pecl/xdebug$xdebug_ver \
    pecl/crypto-devel \
    pecl/libsodium \
"
#pecl/xhprof-beta \

if [ 0$VMAJOR -lt 7 ]; then
    # Newer versions only support PHP 7.0.0+
    # and the pear installer is too dumb to automatically
    # downgrade packages based on dependencies.
    raphf_ver=-1.1.2
    propro_ver=-1.0.2
    http_ver=-2.6.0
else
    raphf_ver=
    propro_ver=
    # We pull 3.1.1RC1 due to
    # https://github.com/m6w6/ext-http/issues/62
    http_ver=-3.1.1
fi

exts="$exts \
pecl/raphf$raphf_ver \
pecl/propro$propro_ver \
pecl/pecl_http$http_ver \
"

for pkg in $exts; do
    echo -n "Installing '$pkg'... "
    ( "$2/bin/pear" info $pkg &> /dev/null && echo "Already installed" ) || \
    ( "$2/bin/pear" install -os $pkg < /dev/null > /dev/null && echo "OK" )
done

exit 0
