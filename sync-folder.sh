#!/bin/bash

for ARG in "$@" 
do
	if [ "$ARG" = '-n' ]; 
	then
		DRY="--dry-run"
		echo "DRY-RUN!"
	else
		DRY=""
	fi
done

USER="remoteuser"
SERVER="server.org"
LOCALDIR="/home/user/dir/"
REMOTEDIR="/var/www/dir"
PERMUSER="www-data"
PERMGRP="www-data"
EXCLUDE=(".git*" "folder2" "file3" ".aaa*")

for EXC in "${EXCLUDE[@]}"
do
	EXCLUDE_STRING+="--exclude=$EXC "
done

echo "Updating friendica root.."
rsync -arzO --update --progress --chown=$PERMUSER:$PERMGRP $LOCALDIR $USER@$SERVER:$REMOTEDIR $EXCLUDE_STRING $DRY

if [ ! -z "$ERROR" ];
then
	echo "ERROR: $ERROR"
  exit -1
else
	echo "done"
fi

exit 0
