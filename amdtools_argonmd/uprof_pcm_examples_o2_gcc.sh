#!/bin/bash

module purge
module load zen

for m in ipc fp dc l1 memory avx_imix ; do
  AMDuProfPcm -m $m -c core=0 --html -O dir_amduprof_o2_gcc_pcm_$m -- taskset -c 0 ./argonmd_o2_gcc.x 5 20000 &>out_amduprof_o2_gcc_pcm_$m
done
