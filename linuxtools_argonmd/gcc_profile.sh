#!/bin/bash

g++ -std=c++11 -g -O3 -funroll-loops -fprofile-generate -o argonmd_o3_unroll_profile.x argonmd.cpp
./argonmd_o3_unroll_profile.x &>out_profile_generate_o3_unroll

g++ -std=c++11 -g -O3 -funroll-loops -fprofile-use -o argonmd_o3_unroll_profile.x argonmd.cpp
./argonmd_o3_unroll_profile.x &>out_profile_use_o3_unroll
