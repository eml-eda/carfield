#!/bin/bash

#########################################################
# This script is used to build the carfield application #
#########################################################

# Source environment
source ./pulp_cluster/pulp-runtime/configs/carfield-cluster.sh

# Build the application
make -j pulpd-sw-build -B -o pulpd-sw-init car-pulpd-sw-offload-tests
