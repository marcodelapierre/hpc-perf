#!/bin/bash

icpx -std=c++11 -g -O3 -unroll -fprofile-instr-generate=pf_o3.raw -o argonmd_o3_unroll_profile.x argonmd.cpp 
./argonmd_o3_unroll_profile.x &>out_profile_generate_o3_unroll

LLVM_PROFDATA="/opt/intel/oneapi/2025.0/bin/compiler/llvm-profdata"
$LLVM_PROFDATA merge -output=pf_o3.data pf_o3.raw

icpx -std=c++11 -g -O3 -unroll -fprofile-instr-use=pf_o3.data -o argonmd_o3_unroll_profile.x argonmd.cpp 
./argonmd_o3_unroll_profile.x &>out_profile_use_o3_unroll
