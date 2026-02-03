#!/bin/sh
VERSION=$1
DIR_FILES=$2
APP_CONF=$DIR_FILES/Pack/src-search/opt/r7-mailserver/mailsearch/appsettings.json
APP_CONF_DEV=$DIR_FILES/Pack/src-search/opt/r7-mailserver/mailsearch/appsettings.Development.json

sudo apt update
sudo apt-get install -y zip unzip jq

cd $DIR_FILES/Pack/src-search/opt/r7-mailserver/mailsearch
zip -r $DIR_FILES/Packages/Bsa.Search.Api.Host_Linux64_${VERSION}.zip *
md5sum $DIR_FILES/Packages/Bsa.Search.Api.Host_Linux64_${VERSION}.zip >> $DIR_FILES/Packages/md5.txt



sed -i "s/Version:.*/Version: ${VERSION}/" $DIR_FILES/Pack/src-search/DEBIAN/control
dpkg-deb -b $DIR_FILES/Pack/src-search $DIR_FILES/Packages/r7mailsearch_${VERSION}.deb
md5sum $DIR_FILES/Packages/r7mailsearch_${VERSION}.deb > $DIR_FILES/Packages/md5.txt