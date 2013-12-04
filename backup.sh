#!/bin/sh

cd $(dirname $0)/web
rm -f *

ftp elie.codeparlesjeunes.ca >/dev/null <<END
prompt
mget *
bye
END

git add -A .
git commit -q -m "Backup on $(date '+%Y/%m/%d %H:%M')"
git push -q origin master
