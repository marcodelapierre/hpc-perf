#!/bin/bash

g++ -fopt-info-all-optall=optinfo-all.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp

# compiler default
g++ -fopt-info-optimized-optall=optinfo.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp

g++ -fopt-info-optimized-missed-optall=optinfo+missed.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp

g++ -ftree-vectorize -fopt-info-missed-vec=vecinfo-missed.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp

g++ -ftree-vectorize -fopt-info-all-vec=vecinfo-all.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp
