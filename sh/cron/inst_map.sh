#!/bin/sh

PROGF="opensim_generatemap_tmux.sh"
CRONF="/var/spool/cron/root"

touch $CRONF
#CHEKF=`cat $CRONF | grep $PROGF`

#if [ "$CHEKF" = "" ]; then
    cat crontab_map >> $CRONF
#    /etc/init.d/crond restart
#fi

install -m 750 $PROGF /usr/local/bin
