#!/bin/sh

if [ "$1" = "" ]; then
    echo $0" opensim_version"
    exit
fi
VER=$1

svn update jogrid.config
svn update opensim.currency
svn update opensim.modules

if [ ! -f bin/config-include/GridHypergrid.ini.bak ]; then
    cp -f bin/config-include/GridHypergrid.ini bin/config-include/GridHypergrid.ini.bak
fi

#
if [ -f jogrid.config/patch/${VER}.patch ]; then
    echo
    echo "*** Applying General patch... ***"
    patch -p0 < jogrid.config/patch/${VER}.patch 
    #[ -f bin/XMLRPC.dll- ] || cp bin/XMLRPC.dll bin/XMLRPC.dll-
    #cp jogrid.config/bin/XMLRPC.dll bin
    sleep 3
fi
if [ -f jogrid.config/patch/patches/opensim_nat_${VER}.patch ]; then
    echo
    echo "*** Applying NAT patch... ***"
    patch -p0 < jogrid.config/patch/patches/opensim_nat_${VER}.patch 
    sleep 3
fi

echo
./build.sh $VER

echo
echo "*** Copy OpenSim.ini ***"
[ -f bin/OpenSim.ini.bak ] || cp -f bin/OpenSim.ini bin/OpenSim.ini.bak
\cp -f bin/OpenSim.ini bin/OpenSim.ini-
\cp -f jogrid.config/config/JOG_HG/$VER/OpenSim.ini bin/OpenSim.ini

echo
echo "*** Copy GridCommon.ini ***"
\cp -f jogrid.config/config/JOG_HG/$VER/config-include/GridCommon.ini bin/config-include/GridCommon.ini

echo
echo "*** Copy GridHypergrid.ini ***"
[ -f bin/config-include/GridHypergrid.ini.bak ] || cp -f bin/config-include/GridHypergrid.ini bin/config-include/GridHypergrid.ini.bak
\cp -f bin/config-include/GridHypergrid.ini bin/config-include/GridHypergrid.ini-
\cp -f jogrid.config/config/JOG_HG/$VER/config-include/GridHypergrid.ini bin/config-include/GridHypergrid.ini
diff   bin/config-include/GridHypergrid.ini.bak bin/config-include/GridHypergrid.ini

echo
echo "*** Copy osslEnable.ini ***"
[ -f bin/config-include/osslEnable.ini.bak ] || cp -f bin/config-include/osslEnable.ini bin/config-include/osslEnable.ini.bak
\cp -f bin/config-include/osslEnable.ini bin/config-include/osslEnable.ini-
\cp -f jogrid.config/config/JOG_HG/$VER/config-include/osslEnable.ini bin/config-include/osslEnable.ini
diff   bin/config-include/osslEnable.ini.bak bin/config-include/osslEnable.ini

