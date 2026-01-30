#!/bin/bash

echo ""
echo "*** INSTALLING ALL DEPENDENCIES ***"
echo ""

apt update
apt -y install wget unzip ufw crunch pv python3-pip python3-dev pkg-config build-essential libssl-dev libffi-dev autoconf libtool swig
apt -y remove python3-urllib3 python3-cryptography python3-idna python3-cffi-backend python3-charset-normalizer
curl https://sh.rustup.rs -sSf | sh -s -- -y
. "$HOME/.cargo/env"
#apt -y install rustup;rustup update stable

echo ""
echo "*** DOWNLOADING BTCRECOVER REPOSITORY ***"
echo ""

wget -O main.zip https://github.com/cryptorecoverytools/btcrecover/archive/refs/heads/main.zip
unzip -oq main.zip
cd btcrecover-main

echo ""
echo "*** INSTALLING THE PYTHON ENVIRONMENT ***"
echo ""

ln -s /usr/bin/python3 /usr/local/bin/python 2>/dev/null
export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
export PIP_BREAK_SYSTEM_PACKAGES=1
export PIP_ROOT_USER_ACTION=ignore
pip3 install maturin cffi
pip3 install -r requirements.txt
apt -y install python3-pyopencl

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
