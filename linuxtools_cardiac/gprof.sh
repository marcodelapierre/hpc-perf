#!/bin/bash

module purge
module load openmpi-gcc

mpicxx -fopenmp -pg -O2 -funroll-loops -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -o heart_demo_o2_unroll_pg.x heart_demo.cpp luo_rudy_1991.cpp rcm.cpp mesh.cpp -Wl,-rpath=$LIBRARY_PATH -Wl,--disable-new-dtags

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"
export GMON_OUT_PREFIX=gmon_o2.out

./heart_demo_o2_unroll_pg.x $FLAGS &>out_gprof_o2

gprof heart_demo_o2_unroll_pg.x ${GMON_OUT_PREFIX}.* &>out_gprof_o2_analysis
