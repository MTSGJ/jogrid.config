#!/bin/bash

VER=$1

find OpenSim -name obj|xargs rm -r

/bin/bash ./runprebuild.sh vs2010
xbuild /target:CLean
#xbuild /p:Configuration=Release || exit 1
xbuild || exit 1

if [ -d opensim.modules ]; then
	cd opensim.modules 
	./build.sh $VER || exit 1
	cd ..
fi

if [ -d opensim.currency ]; then
	cd opensim.currency 
	./build.sh || exit 1
	cd ..
fi

