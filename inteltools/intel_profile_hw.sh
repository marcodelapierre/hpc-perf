#!/bin/bash

icpx -std=c++11 -g -O3 -unroll -fprofile-sample-generate -o argonmd_o3_unroll_profile_hw.x argonmd.cpp 
./argonmd_o3_unroll_profile_hw.x &>out_profile_hw_generate_o3_unroll

# original for Intel CPUs
# perf record -o app.perf.data -b -c 1000003 -e br_inst_retired.near_taken:uppp -- ./app
perf record -o perf_o3_profile_hw_unroll.data -c 1000003 -e ex_ret_near_ret -- ./argonmd_o3_unroll_profile_hw.x &>out_profile_hw_perf_o3_unroll

# this crashes with an error on AMD CPU:
# warning: Found 171 invalid instructions
# llvm-profgen: error: Invalid perf script input!
LLVM_PROFGEN="/opt/intel/oneapi/2025.0/bin/compiler/llvm-profgen"
$LLVM_PROFGEN --perfdata perf_o3_profile_hw_unroll.data --sample-period 1000003 --binary ./argonmd_o3_unroll_profile_hw.x --output perf_o3_profile_hw_unroll.freq.prof

# this could not be run due to error above
icpx -std=c++11 -g -O3 -unroll -fprofile-sample-use=perf_o3_profile_hw_unroll.freq.prof -o argonmd_o3_unroll_profile_hw.x argonmd.cpp 
./argonmd_o3_unroll_profile_hw.x &>out_profile_hw_use_o3_unroll
