#!/bin/bash

echo ""
echo "*** INSTALLING ALL DEPENDENCIES ***"
echo ""

apt update
apt -y install wget unzip ufw crunch pv python3-dev python3-pip cargo autoconf build-essential libtool swig pkg-config
apt -y remove python3-urllib3

echo ""
echo "*** DOWNLOADING BTCRECOVER REPOSITORY ***"
echo ""

wget -O main.zip https://github.com/cryptorecoverytools/btcrecover/archive/refs/heads/main.zip
unzip -o main.zip
cd btcrecover-main

echo ""
echo "*** INSTALLING THE PYTHON ENVIRONMENT ***"
echo ""

ln -s /usr/bin/python3 /usr/local/bin/python 2>/dev/null
export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
pip3 install -r requirements-full.txt --break-system-packages

echo ""
echo "*** PREPARING FIREWALL RULES ***"
echo ""

ufw disable>/dev/null
ufw --force reset>/dev/null
ufw default deny incoming>/dev/null
ufw default deny outgoing>/dev/null
ufw allow in 22/tcp>/dev/null
ufw allow out 22/tcp>/dev/null
ufw allow out 53/udp>/dev/null
ufw --force enable

echo "TO TEMPORARILY DISABLE THE FIREWALL, ENTER: ufw disable"
echo ""
echo "TO START THE RECOVERY PROCESS, PLEASE RUN THE FOLLOWING SCRIPT: ./generate.sh"
