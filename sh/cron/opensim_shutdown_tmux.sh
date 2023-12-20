#!/bin/bash
#
# opensim_shutdown (OpenSim Region Server)
#                                                by Fumi.Iseki
#
#

CHKURL="http://www.jogrid.net/on_robust"
SCRNID="opensim_region"

SVRON=`curl $CHKURL 2>/dev/null`
while [ "$SVRON" != "1" ]; do
    sleep 10
    SVRON=`curl $CHKURL 2>/dev/null`
done

/usr/local/bin/tmux send-keys -t $SCRNID C-m "quit" C-m 

