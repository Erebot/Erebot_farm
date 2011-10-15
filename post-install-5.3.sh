echo "Installing the remaining packages/extensions"
for pkg in                      \
    pecl/xdebug                 \
    pear.phpunit/phpcpd         \
    pear.pdepend.org/PHP_Depend \
    pear.phpmd.org/PHP_PMD      \
    pear/HTTP_Request2-beta     \
    pear.phpunit.de/PHPUnit     \
    pear.phing.info/phing       \
; do
    echo "Installing '$pkg'"
    "$2/bin/pear" install -os $pkg
done

exit 0
