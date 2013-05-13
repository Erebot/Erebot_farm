instdir=$2

echo "Installing the remaining packages/extensions"

for pkg in                      \
    pecl/xdebug                 \
    pear.phpunit.de/phpcpd      \
    pear.pdepend.org/PHP_Depend \
    pear.phpmd.org/PHP_PMD      \
    pear/HTTP_Request2          \
    pear.phpunit.de/PHPUnit     \
    pear.phing.info/phing       \
; do
    echo -n "Installing '$pkg'... "
    ( "$2/bin/pear" info $pkg &> /dev/null && echo "Already installed" ) || \
    ( "$2/bin/pear" install -os $pkg > /dev/null && echo "OK" )
done
exit 0
