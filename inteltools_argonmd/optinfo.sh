#!/bin/bash

icpx -qopt-report=3 -qopt-report-file=optinfo-3.out -std=c++11 -g -O3 -unroll -march=core-avx2 -axCORE-AVX2 -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp

icpx -fvectorize -qopt-report=3 -qopt-report-phase=vec -qopt-report-file=vecinfo-3.out -std=c++11 -g -O3 -unroll -march=core-avx2 -axCORE-AVX2 -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp
