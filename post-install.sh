#!/bin/bash
instdir=$2
pear="$instdir/bin/pear"

echo "Discovering required pear channels"
for channel in pear.phpunit.de pear.phing.info pear.pdepend.org pear.phpmd.org components.ez.no pear.symfony-project.com; do
    already=`"$instdir/bin/pear" list-channels | grep $channel`
    if [ -z "$already" ]; then 
       "$pear" channel-discover $channel
    fi
done

echo "Installing common packages/extensions"
"$pear" install -os pear/PHP_ParserGenerator-alpha
"$pear" install -os pear/VersionControl_SVN-alpha
"$pear" install -os pear/VersionControl_Git-alpha
"$pear" install -os pear/File_Gettext-beta
"$pear" install -os pear/PHP_CodeSniffer

exit 0
