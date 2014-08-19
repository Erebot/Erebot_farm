echo "Installing the remaining packages/extensions"

exts=" \
    pecl/xdebug \
    pecl/xhprof-beta \
"

if [ "$VMAJOR.$VMINOR" = "5.4" -a "$ARCH" != "i386" ]; then
    exts="$exts \
    pecl/ssh2-beta \
    pecl/pecl_http-1.7.6 \
    "
fi

for pkg in $exts; do
    echo -n "Installing '$pkg'... "
    ( "$2/bin/pear" info $pkg &> /dev/null && echo "Already installed" ) || \
    ( "$2/bin/pear" install -os $pkg < /dev/null > /dev/null && echo "OK" )
done

exit 0
