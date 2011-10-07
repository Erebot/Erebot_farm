instdir=$2
pear="$instdir/bin/pear"

echo "Installing the remaining packages/extensions"
"$pear" install pecl/xdebug

# @BUG: File_Iterator > 1.2.4 requires pear >= 1.9.2.
"$pear" install phpunit/File_Iterator-1.2.4
"$pear" install phpunit/phpcpd

# @BUG: PHP_Depend >= 0.10.x is incompatible with phing 2.4.3.
"$pear" install pdepend/PHP_Depend-0.9.19

# @BUG: PHP_PMD depends on certain versions of PHP_Depend, but see above.
"$pear" install phpmd/PHP_PMD-0.2.7

"$pear" install pecl/intl
"$pear" install pecl/hash
"$pear" install pecl/phar
"$pear" install phpunit/PHPUnit-3.4.0
"$pear" install phing/phing-2.4.3

exit 0
