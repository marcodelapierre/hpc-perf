#!/bin/bash

module purge
module load zen
module load openmpi-aocc

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"


# threading
export OMP_NUM_THREADS=2
type=threading
AMDuProfCLI collect --config $type -g \
  -o dir_amduprof_o2_unroll_gcc_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*

# OpenMP trace (GCC)
export OMP_NUM_THREADS=2
type=omp
omp_flags="--trace openmp --openmp-impl omplib" # GCC
#omp_flags="--trace openmp --openmp-impl ompt --openmp-scope basic" # OMPT eg AOCC
AMDuProfCLI collect $omp_flags \
  -o dir_amduprof_o2_unroll_gcc_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*

# MPI (OpenMPI)
export OMP_NUM_THREADS=1
type=mpi
mpi_flags="--trace mpi --mpi-impl openmpi"
mpirun -n 2 AMDuProfCLI collect $mpi_flags \
  -o dir_amduprof_o2_unroll_gcc_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*

