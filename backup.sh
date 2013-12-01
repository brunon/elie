#!/bin/sh

cd $(dirname $0)/web
rm -f *

ftp elie.codeparlesjeunes.ca <<END
prompt
mget *
bye
END

git add -A .
git commit -m "Backup on $(date '+%Y/%m/%d %H:%M')"
git push origin master
