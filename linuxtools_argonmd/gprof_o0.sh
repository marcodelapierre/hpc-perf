#!/bin/bash

g++ -std=c++11 -pg -O0 -o argonmd_o0_pg.x argonmd.cpp 

export GMON_OUT_PREFIX=gmon_o0.out
./argonmd_o0_pg.x &>out_gprof_o0

gprof argonmd_o0_pg.x ${GMON_OUT_PREFIX}.* &>out_gprof_o0_analysis

