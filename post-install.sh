#!/bin/bash
instdir=$2
pear="$instdir/bin/pear"

echo "Discovering required pear channels"
for channel in pear.phpunit.de pear.phing.info pear.pdepend.org pear.phpmd.org components.ez.no pear.symfony-project.com
do
    "$pear" channel-discover $channel
done

echo "Installing common packages/extensions"
"$pear" install pear/PHP_ParserGenerator-alpha
"$pear" install pear/VersionControl_SVN-alpha
"$pear" install pear/VersionControl_Git-alpha
"$pear" install pear/File_Gettext-beta
"$pear" install pear/PHP_CodeSniffer

exit 0
