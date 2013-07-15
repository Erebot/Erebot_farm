echo "Installing the remaining packages/extensions"
for pkg in                      \
    pecl/xdebug                 \
; do
    echo -n "Installing '$pkg'... "
    ( "$2/bin/pear" info $pkg &> /dev/null && echo "Already installed" ) || \
    ( "$2/bin/pear" install -os $pkg > /dev/null && echo "OK" )
done

exit 0
