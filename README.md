# rsync-server
Bash script to sync a folder with a remote one. I used it to develop on my local maschine with IDE and make changes on server valid without pushing and pulling git.

The script will connects via `ssh` and uses `rsync` to copy files (if necessary).

If no ssh key is used a password prompt will be needed to fill before syncing.

##HowTo
1. Download the script
2. Set Config Variables in script (see below)
3. Make it runnable `chmod +x sync-folder.sh`

##Config

|Config|Description|
|---|---|
|USER| SSH user|
|SERVER|server to connect to|
|LOCALDIR|local directoy to want to sync from(!)|
|REMOTEDIR|remote directory to want to copy to|
|PERMUSER|user that the files should belong to on the serverside (like `www-data`)|
|PERMGRP|groups as in `PERMUSER`|
|EXCLUDE|select which folder in local directory will be ignored|

##Rsync flags

|Flag|Description|
|---|---|
|`--chown`|setting permissions user/group|
|`--update`|only transfer new files|
|`-O`|prevent updating timestamp (may leads to errors without)|
