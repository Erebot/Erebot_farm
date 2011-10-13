echo "Installing common packages/extensions..."
for pkg in                          \
    pear/PHP_ParserGenerator-alpha  \
    pear/VersionControl_SVN-alpha   \
    pear/VersionControl_Git-alpha   \
    pear/File_Gettext-beta          \
    pear/PHP_CodeSniffer            \
; do
    echo "Installing '$pkg'"
    "$2/bin/pear" install -os
done

exit 0
