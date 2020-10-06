#!/bin/sh
RASPI="pi@ninjaqpcr.local"
RSYNC="rsync -auvz" # Deploy
# RSYNC="rsync -auvzn" # Dry run
HOME=""
# startup
ssh $RASPI "cd /user/local/ninjaqpcr/qpcr; npm update";
ssh $RASPI "cd /user/local/ninjaqpcr/console/server; npm update";
