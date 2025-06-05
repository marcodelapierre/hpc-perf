#!/bin/bash

g++ -std=c++11 -pg -O2 -o argonmd_o2_pg.x argonmd.cpp 

export GMON_OUT_PREFIX=gmon_o2.out
./argonmd_o2_pg.x &>out_gprof_o2

gprof argonmd_o2_pg.x ${GMON_OUT_PREFIX}.* &>out_gprof_o2_analysis

