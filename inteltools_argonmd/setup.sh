#!/bin/bash

module purge
. /opt/intel/oneapi/setvars.sh

#git clone git@github.com:marcodelapierre/argonmd
#cp argonmd/serial_one_source/argonmd.cpp .

for olev in 0 1 2 3 fast ; do
  icpx -std=c++11 -g -O${olev} -o argonmd_o${olev}.x argonmd.cpp
done

icpx -std=c++11 -g -O3 -unroll -o argonmd_o3_unroll.x argonmd.cpp
icpx -std=c++11 -g -O3 -vec -o argonmd_o3_vector.x argonmd.cpp

# `-march=native -axhost` faster than `-march=core-avx2 -axCORE-AVX2`
for olev in 0 1 2 3 fast ; do
  icpx -std=c++11 -g -O${olev} -march=native -axhost -o argonmd_o${olev}_march.x argonmd.cpp
done
icpx -std=c++11 -g -O3 -unroll -march=native -axhost -o argonmd_o3_unroll_march.x argonmd.cpp
icpx -std=c++11 -g -Ofast -unroll -march=native -axhost -o argonmd_ofast_unroll_march.x argonmd.cpp
