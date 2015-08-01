echo "Installing the remaining packages/extensions"

if [ "$VMAJOR.$VMINOR" = "0.0" ]; then
    exit 0
fi

exts=" \
    pecl/xdebug \
    pecl/xhprof-beta \
    pecl/vld-beta \
"

if [ "$ARCH" != "i386" ]; then
    exts="$exts \
    pecl/raphf \
    pecl/propro \
    pecl/pecl_http \
    "
fi

if [ "$VMAJOR.$VMINOR" = "5.4" -a "$ARCH" != "i386" ]; then
    exts="$exts \
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
