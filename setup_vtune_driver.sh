#!/bin/bash

module purge
. /opt/intel/oneapi/setvars.sh

cd /opt/intel/oneapi/vtune/2025.0/sepdk/src
sudo ./insmod-sep -r -g users
sudo ./boot-script --install

