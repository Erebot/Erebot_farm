instdir=$2
pear="$instdir/bin/pear"

echo "Installing the remaining packages/extensions"
"$pear" install -os pecl/xdebug
"$pear" install -os phpunit/phpcpd
"$pear" install -os pdepend/PHP_Depend
"$pear" install -os phpmd/PHP_PMD
"$pear" install -os pear/HTTP_Request2-beta
"$pear" install -os phpunit/PHPUnit
"$pear" install -os phing/phing

exit 0
