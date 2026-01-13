#!/bin/bash

#############################################################
# This script is used to setup the environment for carfield #
#############################################################

# Build and activate the venv
make venv && \
source ./.venv/bin/activate && \

# Build needed components once
git submodule update --init --recursive && \
make car-update-deps && \

cd ./cheshire && \
make -j clint chs-sw-all && \
cd ../ && \
make -j car-sw-libs -B && \

cd ./pulp_cluster/ && \
make pulp-runtime && \
cd ../ && \

source ./pulp_cluster/pulp-runtime/configs/carfield-cluster.sh && \
make -j pulpd-sw-init -B && \
echo "Environment setup completed."