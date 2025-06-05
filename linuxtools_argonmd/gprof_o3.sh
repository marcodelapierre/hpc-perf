#!/bin/bash

g++ -std=c++11 -pg -O3 -o argonmd_o3_pg.x argonmd.cpp 

export GMON_OUT_PREFIX=gmon_o3.out
./argonmd_o3_pg.x &>out_gprof_o3

gprof argonmd_o3_pg.x ${GMON_OUT_PREFIX}.* &>out_gprof_o3_analysis

