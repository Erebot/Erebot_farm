echo "Installing the remaining packages/extensions..."
# @BUG: File_Iterator > 1.2.4 requires pear >= 1.9.2.
# @BUG: PHP_Depend >= 0.10.x is incompatible with phing 2.4.3.
# @BUG: PHP_PMD depends on certain versions of PHP_Depend, but see above.
for pkg in                              \
    pecl/intl                           \
    pecl/hash                           \
    pecl/phar                           \
    pecl/xdebug                         \
    pear.phpunit.de/File_Iterator-1.2.4 \
    pear.phpunit.de/phpcpd              \
    pear.pdepend.org/PHP_Depend-0.9.19  \
    pear.phpmd.org/PHP_PMD-0.2.7        \
    pear.phpunit.de/PHPUnit-3.4.0       \
    pear.phing.info/phing-2.4.3         \
; do
    echo "Installing '$pkg'"
    "$2/bin/pear" install -os
done

exit 0
