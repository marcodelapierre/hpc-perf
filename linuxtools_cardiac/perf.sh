#!/bin/bash
# online docs https://sourceware.org/binutils/docs-2.42/gprofng.html

module purge
module load openmpi-gcc

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"

perf stat ./heart_demo_o2_unroll.x $FLAGS &>out_perf_stat_o2

perf record -o perf_o2.data ./heart_demo_o2_unroll.x $FLAGS &>out_perf_record_o2

perf report --stdio -i perf_o2.data &>out_perf_report_o2
perf script -i perf_o2.data &>out_perf_script_o2


# seems like `perf` only supports pthreads, not OpenMP
#export OMP_NUM_THREADS=2
#perf record -s -o perf_o2_thr.data ./heart_demo_o2_unroll.x $FLAGS &>out_perf_record_o2_thr
#perf report -n -T --stdio -i perf_o2_thr.data &>out_perf_report_o2_thr
