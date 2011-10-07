instdir=$2
pear="$instdir/bin/pear"

echo "Installing the remaining packages/extensions"
"$pear" install pecl/xdebug
"$pear" install phpunit/phpcpd
"$pear" install pdepend/PHP_Depend
"$pear" install phpmd/PHP_PMD
"$pear" install pear/HTTP_Request2-beta
"$pear" install phpunit/PHPUnit
"$pear" install phing/phing

exit 0
