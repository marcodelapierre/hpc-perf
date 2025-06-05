#!/bin/bash

clang++ -std=c++11 -g -O3 -funroll-loops -fprofile-instr-generate=pf_o3.raw -o argonmd_o3_unroll_profile.x argonmd.cpp 
./argonmd_o3_unroll_profile.x &>out_profile_generate_o3_unroll
llvm-profdata merge -output=pf_o3.data pf_o3.raw

clang++ -std=c++11 -g -O3 -funroll-loops -fprofile-instr-use=pf_o3.data -o argonmd_o3_unroll_profile.x argonmd.cpp 
./argonmd_o3_unroll_profile.x &>out_profile_use_o3_unroll
