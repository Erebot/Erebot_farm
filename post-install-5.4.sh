instdir=$2
pear="$instdir/bin/pear"

echo "Installing the remaining packages/extensions"
# @BUG: only xdebug-dev is known to work with PHP 5.4 ATM.
tmp=/tmp/pear.`echo $RANDOM`
mkdir "$tmp"
pushd "$tmp"
    wget -O- https://github.com/derickr/xdebug/tarball/master | tar zxvf - --strip-components 1
    "$instdir/bin/phpize" && \
    ./configure --with-php-config="$instdir/bin/php-config" && \
    make && \
    make install
popd
rm -rf "$tmp"

"$pear" install phpunit/phpcpd
"$pear" install pdepend/PHP_Depend
"$pear" install phpmd/PHP_PMD
"$pear" install pear/HTTP_Request2-beta
"$pear" install phpunit/PHPUnit
"$pear" install phing/phing

exit 0
