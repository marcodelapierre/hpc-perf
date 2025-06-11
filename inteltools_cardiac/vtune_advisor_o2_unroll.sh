#!/bin/bash

module purge
. /opt/intel/oneapi/setvars.sh

export OMP_NUM_THREADS=1 
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1 -i"

export OMP_NUM_THREADS=2
vtune -collect threading -run-pass-thru=-timestamp=sys -r ./vtune_o2_unroll_threading -- ./heart_demo_o2_unroll.x $FLAGS &>out_vtune_o2_unroll_threading

export OMP_NUM_THREADS=1
# hpc-performance is the interesting one for MPI - not working on AMD CPUs as it needs HW counters
#mpirun -n 2 vtune -collect hpc-performance -trace-mpi -run-pass-thru=-timestamp=sys -r ./vtune_o2_unroll_mpi_hpc -- ./heart_demo_o2_unroll.x $FLAGS &>out_vtune_o2_unroll_mpi_hpc
mpirun -n 2 vtune -collect hotspots -trace-mpi -run-pass-thru=-timestamp=sys -r ./vtune_o2_unroll_mpi -- ./heart_demo_o2_unroll.x $FLAGS &>out_vtune_o2_unroll_mpi

# vectorisation example from tutorial

mpirun -genvall -n 4 -gtool "advisor --collect=survey --run-pass-thru=timestamp=sys --project-dir=./adv_o2_unroll_vec:0" ./heart_demo_o2_unroll.x $FLAGS &>out_adv_survey_o2_unroll_vec

mpirun -genvall -n 4 -gtool "advisor --collect=tripcounts --flop --project-dir=./adv_o2_unroll_vec:0" ./heart_demo_o2_unroll.x $FLAGS &>out_adv_tripcounts_o2_unroll_vec

# note that info on vectorisation is missing from Advisor output
# unlike in tutorial - another amd cpu caveat?
