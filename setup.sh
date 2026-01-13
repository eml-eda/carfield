#!/bin/bash

#############################################################
# This script is used to setup the environment for carfield #
#############################################################

git submodule update --init --recursive

# Build and activate the venv
make venv
source ./.venv/bin/activate

# Build needed components once
cd ./cheshire
make -j clint
make -j chs-sw-all 
cd ../
make -j car-sw-libs -B
make -j pulpd-sw-init

source ./env/env-non-iis.sh
echo "Environment setup completed."