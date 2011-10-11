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

"$pear" install -os phpunit/phpcpd
"$pear" install -os pdepend/PHP_Depend
"$pear" install -os phpmd/PHP_PMD
"$pear" install -os pear/HTTP_Request2-beta
"$pear" install -os phpunit/PHPUnit
"$pear" install -os phing/phing

exit 0
