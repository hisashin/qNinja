#!/bin/sh
RASPI="pi@ninjaqpcr.local"
RSYNC="rsync -auvz" # Deploy
# RSYNC="rsync -auvzn" # Dry run
HOME=""
# startup
ssh $RASPI "cd /usr/local/ninjaqpcr/qpcr; npm update";
ssh $RASPI "cd /usr/local/ninjaqpcr/console/server; npm update";
