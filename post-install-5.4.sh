instdir=$2

echo "Installing the remaining packages/extensions"
# @BUG: only xdebug-dev is known to work with PHP 5.4 ATM.
tmp=/tmp/pear.`echo $RANDOM`
mkdir "$tmp"
pushd "$tmp"
    echo "Installing xdebug-dev"
    wget -O- https://github.com/derickr/xdebug/tarball/master | tar zxvf - --strip-components 1
    "$instdir/bin/phpize" && \
    ./configure --with-php-config="$instdir/bin/php-config" && \
    make && \
    make install
popd
rm -rf "$tmp"

for pkg in                      \
    pear.phpunit/phpcpd         \
    pear.pdepend.org/PHP_Depend \
    pear.phpmd.org/PHP_PMD      \
    pear/HTTP_Request2-beta     \
    pear.phpunit.de/PHPUnit     \
    pear.phing.info/phing       \
; do
    echo "Installing '$pkg'"
    "$2/bin/pear" install -os
done

exit 0
