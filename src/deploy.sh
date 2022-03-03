#!/bin/sh
RASPI="pi@ninjaqpcr.local"
RSYNC="rsync -auvz" # Deploy
# RSYNC="rsync -auvzn" # Dry run
HOME=""
# startup
ssh $RASPI "mkdir -p /usr/local/ninjaqpcr /usr/local/ninjaqpcr/console /usr/local/ninjaqpcr/client /usr/local/ninjaqpcr/startup";
echo "Syncing qpcr"
$RSYNC ./qpcr/ $RASPI:/usr/local/ninjaqpcr/qpcr --exclude='node_modules/' --exclude='package-lock.json' --exclude='.DS_Store'
echo "Syncing console/server"
$RSYNC ./console/server/ $RASPI:/usr/local/ninjaqpcr/console/server --exclude='node_modules/' --exclude='package-lock.json' --exclude='.DS_Store'
echo "Syncing console/client/dist"
$RSYNC ./console/client/dist/ $RASPI:/usr/local/ninjaqpcr/console/client/dist --exclude='.DS_Store'
echo "Syncing startup"
$RSYNC ./startup/ $RASPI:/usr/local/ninjaqpcr/startup --exclude='.DS_Store'
echo "Syncing network_conf_app"
$RSYNC ./network_conf_app/ $RASPI:/usr/local/ninjaqpcr/network_conf_app

