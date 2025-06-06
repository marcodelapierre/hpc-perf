#!/bin/bash

git clone git@github.com:marcodelapierre/argonmd
cp argonmd/serial_one_source/argonmd.cpp .

for olev in 0 1 2 3 fast ; do
  g++ -std=c++11 -g -O${olev} -o argonmd_o${olev}.x argonmd.cpp
done
for olev in 3 fast ; do
  g++ -std=c++11 -g -O${olev} -funroll-loops -o argonmd_o${olev}_unroll.x argonmd.cpp
done
g++ -std=c++11 -g -O3 -funroll-loops -fprefetch-loop-arrays -o argonmd_o3_unroll_prefetch.x argonmd.cpp
g++ -std=c++11 -g -O3 -funroll-loops -fprefetch-loop-arrays -flto -o argonmd_o3_unroll_prefetch_lto.x argonmd.cpp

for olev in 0 1 2 3 fast ; do
  g++ -std=c++11 -g -O${olev} -march=native -o argonmd_o${olev}_march.x argonmd.cpp
done
for olev in 3 fast ; do
  g++ -std=c++11 -g -O${olev} -march=native -funroll-loops -o argonmd_o${olev}_unroll_march.x argonmd.cpp
done
