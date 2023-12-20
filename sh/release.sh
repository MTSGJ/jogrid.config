#!/bin/bash

rm -r OpenSim
rm -r Prebuild

rm bin/*.log
rm bin/*.db
rm bin/Regions/*.ini 
rm bin/OpenSimConsoleHistory.txt
rm -r bin/addin-db-*/
rm -r bin/assetcache/*
rm -r bin/maptiles/*

rm Makefile OpenSim.sln nant-color prebuild.xml runprebuild.bat 
rm *.sh
