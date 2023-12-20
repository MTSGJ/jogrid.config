#!/bin/bash
#
# opensim_shutdown (OpenSim Region Server)
#                                                by Fumi.Iseki
#
#

CHKURL="http://www.jogrid.net/on_robust"
SCRNID="opensim_osg"

SVRON=`curl $CHKURL 2>/dev/null`
while [ "$SVRON" != "1" ]; do
    sleep 10
    SVRON=`curl $CHKURL 2>/dev/null`
done

screen -S $SCRNID -p 0 -X stuff $'quit\n' 1> /dev/null 2>&1

