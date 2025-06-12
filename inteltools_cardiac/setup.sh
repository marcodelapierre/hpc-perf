#!/bin/bash

module purge
. /opt/intel/oneapi/setvars.sh

#git clone git@github.com:marcodelapierre/cardiac_demo
#cp -p cardiac_demo/*.cpp .
#cp -p cardiac_demo/*.hpp .
#cp -p cardiac_demo/*.h .
#cp -p cardiac_demo/mesh_small.* cardiac_demo/mesh_mid.* .
#cp -p cardiac_demo/setup_small.txt cardiac_demo/setup_mid.txt .

sed -i 's;class vector<Facet>;class std::vector<Facet>;g' mesh.cpp

# `-march=native -axhost` faster than `-march=core-avx2 -axCORE-AVX2`
for opt in 0 1 2 3 ; do 
  mpiicpx -fiopenmp -g -O${opt} -unroll -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -o heart_demo_o${opt}_unroll.x heart_demo.cpp luo_rudy_1991.cpp rcm.cpp mesh.cpp -Wl,-rpath=$LIBRARY_PATH -Wl,--disable-new-dtags

  mpiicpx -fiopenmp -g -O${opt} -unroll -march=native -axhost -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -o heart_demo_o${opt}_unroll_march.x heart_demo.cpp luo_rudy_1991.cpp rcm.cpp mesh.cpp -Wl,-rpath=$LIBRARY_PATH -Wl,--disable-new-dtags
done
