#!/bin/bash

module purge
module load zen
module load openmpi-aocc

export OMP_NUM_THREADS=1 
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"

for opt in 0 1 2 3 ; do
  (time ./heart_demo_o${opt}_unroll.x $FLAGS) &>out_time_o${opt}_unroll
done

for opt in 0 1 2 3 ; do
  (time ./heart_demo_o${opt}_unroll_march.x $FLAGS) &>out_time_o${opt}_unroll_march
done

