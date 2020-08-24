#!/bin/sh
RASPI="pi@ninjaqpcr.local"
RSYNC="rsync -auvz" # Deploy
# RSYNC="rsync -auvzn" # Dry run
HOME=""
# startup
ssh $RASPI "mkdir -p /home/pi/ninjaqpcr /home/pi/ninjaqpcr/console /home/pi/ninjaqpcr/client";
echo "Syncing qpcr"
$RSYNC ./qpcr/ $RASPI:/home/pi/ninjaqpcr/qpcr --exclude='node_modules/' --exclude='package-lock.json' --exclude='.DS_Store'
echo "Syncing console/server"
$RSYNC ./console/server/ $RASPI:/home/pi/ninjaqpcr/console/server --exclude='node_modules/' --exclude='package-lock.json' --exclude='.DS_Store'
echo "Syncing console/client/dist"
$RSYNC ./console/client/dist/ $RASPI:/home/pi/ninjaqpcr/console/client/dist --exclude='.DS_Store'
echo "Syncing startup"
$RSYNC ./startup/ $RASPI:/home/pi/ninjaqpcr/startup
echo "Syncing network_conf_app"
$RSYNC ./network_conf_app/ $RASPI:/home/pi/ninjaqpcr/network_conf_app
