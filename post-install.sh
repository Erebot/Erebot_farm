
# Make sure pear is in auto_discover mode.
"$2/bin/pear" config-set auto_discover 1

echo "Installing common packages/extensions..."
for pkg in                          \
    pear/PHP_ParserGenerator-alpha  \
    pear/File_Gettext-beta          \
    pear/PHP_CodeSniffer            \
    pear/Console_CommandLine        \
; do
    echo "Installing '$pkg'"
    "$2/bin/pear" install -os $pkg
done

exit 0
