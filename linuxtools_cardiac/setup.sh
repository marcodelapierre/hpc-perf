#!/bin/bash

module purge
module load openmpi-gcc

git clone git@github.com:marcodelapierre/cardiac_demo
cp -p cardiac_demo/*.cpp .
cp -p cardiac_demo/*.hpp .
cp -p cardiac_demo/*.h .
cp -p cardiac_demo/mesh_small.* cardiac_demo/mesh_mid.* .
cp -p cardiac_demo/setup_small.txt cardiac_demo/setup_mid.txt .

for opt in 0 1 2 3 ; do 
  mpicxx -fopenmp -g -O${opt} -funroll-loops -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -o heart_demo_o${opt}_unroll.x heart_demo.cpp luo_rudy_1991.cpp rcm.cpp mesh.cpp -Wl,-rpath=$LIBRARY_PATH -Wl,--disable-new-dtags

  mpicxx -fopenmp -g -O${opt} -funroll-loops -march=native -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -o heart_demo_o${opt}_unroll_march.x heart_demo.cpp luo_rudy_1991.cpp rcm.cpp mesh.cpp -Wl,-rpath=$LIBRARY_PATH -Wl,--disable-new-dtags
done
