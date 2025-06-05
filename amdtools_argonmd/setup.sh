#!/bin/bash

#git clone git@github.com:marcodelapierre/argonmd
#cp argonmd/serial_one_source/argonmd.cpp .

for olev in 0 1 2 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -o argonmd_o${olev}.x argonmd.cpp
done

for olev in 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -funroll-loops -o argonmd_o${olev}_unroll.x argonmd.cpp
done
for olev in 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -zopt -o argonmd_o${olev}_zopt.x argonmd.cpp
done

clang++ -std=c++11 -g -O3 -floop-transform -faggressive-loop-transform -o argonmd_o3_loop.x argonmd.cpp
clang++ -std=c++11 -g -O3 -fvector-transform -mllvm -enable-strided-vectorization -o argonmd_o3_vector.x argonmd.cpp
clang++ -std=c++11 -g -O3 -flto -fremap-arrays -mllvm -reduce-array-computations=3 -o argonmd_o3_memory.x argonmd.cpp

for olev in 0 1 2 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -march=native -o argonmd_o${olev}_march.x argonmd.cpp
done
for olev in 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -march=native -funroll-loops -o argonmd_o${olev}_unroll_march.x argonmd.cpp
done
for olev in 3 fast ; do
  clang++ -std=c++11 -g -O${olev} -march=native -zopt -o argonmd_o${olev}_zopt_march.x argonmd.cpp
done

clang++ -std=c++11 -g -O3 -L$AOCL_ROOT/lib -lamdlibm -lm -o argonmd_o3_amdlibm.x argonmd.cpp
clang++ -std=c++11 -g -O3 -L$AOCL_ROOT/lib -fveclib=AMDLIBM -lamdlibm -lm -o argonmd_o3_amdlibm_vec.x argonmd.cpp
clang++ -std=c++11 -g -Ofast -L$AOCL_ROOT/lib -ffastlib=AMDLIBM -lamdlibmfast -lamdlibm -lm -o argonmd_ofast_amdlibm_fast.x argonmd.cpp

clang++ -std=c++11 -g -O3 -march=native -L$AOCL_ROOT/lib -lamdlibm -lm -o argonmd_o3_amdlibm_march.x argonmd.cpp
clang++ -std=c++11 -g -O3 -march=native -L$AOCL_ROOT/lib -fveclib=AMDLIBM -lamdlibm -lm -o argonmd_o3_amdlibm_vec_march.x argonmd.cpp
clang++ -std=c++11 -g -Ofast -march=native -L$AOCL_ROOT/lib -ffastlib=AMDLIBM -lamdlibmfast -lamdlibm -lm -o argonmd_ofast_amdlibm_fast_march.x argonmd.cpp
