#!/bin/bash
# online docs https://sourceware.org/binutils/docs-2.42/gprofng.html

module purge
module load openmpi-gcc

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"

gprofng collect app -O gprofng_o2.er ./heart_demo_o2_unroll.x $FLAGS &>out_gprofng_o2

gprofng display text -script script.gpng gprofng_o2.er/ &>out_gprofng_o2_analysis


export OMP_NUM_THREADS=2
gprofng collect app -O gprofng_o2_thr.er ./heart_demo_o2_unroll.x $FLAGS &>out_gprofng_o2_thr
gprofng display text -script script_threads.gpng gprofng_o2_thr.er/ &>out_gprofng_o2_thr_analysis

# single HW thread core places for a 6 core CPU with subsequent HW threads
export OMP_PLACES={0:1}:6:2
export OMP_PROC_BIND=true
gprofng collect app -O gprofng_o2_thr_aff.er ./heart_demo_o2_unroll.x $FLAGS &>out_gprofng_o2_thr_aff
gprofng display text -script script_threads.gpng gprofng_o2_thr_aff.er/ &>out_gprofng_o2_thr_aff_analysis
