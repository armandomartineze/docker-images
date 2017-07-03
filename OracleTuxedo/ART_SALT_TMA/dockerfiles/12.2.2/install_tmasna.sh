#!/bin/sh
#
# Script file for Tuxedo TMASNA  silent install mode
#
# This procedure assumes that the following files are in the current directory:
#	install_tmasna.sh        		- This file
#	tmasna12.2.2.rsp			- Silent install response file
#
#   and that these files can be found in the in /home/oracle/Downloads
#	tmasna122200_64_Linux_01_x86.zip	- TMASNA installation kit from Oracle
#
# Get the arguments
#set -x
CURDIR=`pwd`
INSTALLER=tmasna122200_64_linux_x86_64.zip
echo "Using TMASNA installer $INSTALLER"
# Unzip the downloaded installation kit to the current directory
cd /home/oracle/Downloads
unzip -qq /home/oracle/Downloads/$INSTALLER
# Need to create oraInst.loc first:
echo "inventory_loc=/home/oracle/oraInventory" > /home/oracle/Downloads/oraInst.loc
echo "inst_group=oracle" >> /home/oracle/Downloads/oraInst.loc
# Run the installer in silent mode
JAVA_HOME=/usr/java/default ./Disk1/install/runInstaller.sh -invPtrLoc /home/oracle/Downloads/oraInst.loc -responseFile $CURDIR/tmasna12.2.2.rsp -silent -waitforcompletion
# Remove the installer and generated response file
rm -Rf Disk1 $INSTALLER
echo "TMASNA installation done"
