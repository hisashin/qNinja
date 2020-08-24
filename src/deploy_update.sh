#!/bin/sh
RASPI="pi@ninjaqpcr.local"
RSYNC="rsync -auvz" # Deploy
# RSYNC="rsync -auvzn" # Dry run
HOME=""
# startup
ssh $RASPI "cd /home/pi/ninjaqpcr/qpcr; npm update";
ssh $RASPI "cd /home/pi/ninjaqpcr/console/server; npm update";
