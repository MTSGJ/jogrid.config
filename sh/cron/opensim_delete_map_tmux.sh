#!/bin/sh

MAPDIR=maptiles

cd /usr/local/opensim_server/bin
/bin/rm -rf ${MAPDIR}.backup
/bin/mv -f $MAPDIR ${MAPDIR}.backup
