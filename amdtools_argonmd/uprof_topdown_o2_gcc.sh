#!/bin/bash

module purge
module load zen

# pipeline_util metric unsupported on my laptop
AMDuProfPcm -m pipeline_util -A system -c core=0 -o out_amduprof_o2_gcc_topdown.csv -- taskset -c 0 ./argonmd_o2_gcc.x
