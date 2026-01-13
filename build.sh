#!/bin/bash

#########################################################
# This script is used to build the carfield application #
#########################################################

# Source environment
source ./pulp_cluster/pulp-runtime/configs/carfield-cluster.sh

# Build the application, overriding CHS_SW_FLAGS to ignore some warnings
export CHS_SW_FLAGS="-DOT_PLATFORM_RV32 -march=rv64gc -mabi=lp64d -mstrict-align -O2 -Wall -Wno-implicit-function-declaration -Wno-int-conversion -Wno-incompatible-pointer-types -Wextra -static -ffunction-sections -fdata-sections -frandom-seed=cheshire -fuse-linker-plugin -flto -Wl,-flto"
make -j pulpd-sw-build -o pulpd-sw-init 
make -j car-pulpd-sw-offload-tests
