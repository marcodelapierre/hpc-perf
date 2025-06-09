#!/bin/bash

module purge
module load zen
module load openmpi-aocc

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"


# collect

for type in hotspots tbp assess branch ibs ; do 
  AMDuProfCLI collect --config $type -g \
    -o dir_amduprof_o2_unroll_gcc_$type \
    ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
done
# oveview does not support -g (callstack)
for type in overview ; do 
  AMDuProfCLI collect --config $type \
    -o dir_amduprof_o2_unroll_gcc_$type \
    ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
done


# report

for type in hotspots tbp overview assess branch ibs ; do
  AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*
done
