#!/bin/bash
#
# opensim_generatemap (OpenSim Region Server)
#                                                by Fumi.Iseki
#
#

SCRNID="opensim_region"

/usr/local/bin/tmux send-keys -t $SCRNID C-m "generate map" C-m 

