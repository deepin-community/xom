#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
DIR=xom_$2.orig

# clean up the upstream tarball
tar zxf $3
mv XOM $DIR
GZIP=--best tar czf $3 --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
    . .svn/deb-layout
    mv $3 $origDir
    echo "moved $3 to $origDir"
fi

exit 0
