#!/bin/bash

module purge
module load zen
module load openmpi-aocc

export OMP_NUM_THREADS=1
export FLAGS=" -m ./mesh_mid -s ./setup_mid.txt -t 1"


# threading
export OMP_NUM_THREADS=6
type=omp_prof
omp_flags="--config threading -g"
AMDuProfCLI collect $omp_flags \
  -o dir_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type
AMDuProfCLI report \
    -g --detail --inline \
    --export-session \
    -i dir_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type/AMD*

# OpenMP trace (GCC)
#export OMP_NUM_THREADS=6
#type=omp
#omp_flags="--trace openmp --openmp-impl omplib" # GCC
##omp_flags="--trace openmp --openmp-impl ompt --openmp-scope basic" # OMPT eg AOCC
#AMDuProfCLI collect $omp_flags \
#  -o dir_amduprof_o2_unroll_gcc_$type \
#  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
#AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*

# OpenMP trace (GCC) + tbp
export OMP_NUM_THREADS=6
type=omp_trace
omp_flags="--config tbp --trace openmp --openmp-impl omplib --openmp-scope full" # GCC
#omp_flags="--config tbp --trace openmp --openmp-impl ompt --openmp-scope basic" # OMPT eg AOCC
AMDuProfCLI collect $omp_flags \
  -o dir_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type
AMDuProfCLI report \
    -g --detail --inline \
    --export-session \
    -i dir_amduprof_o2_unroll_gcc_thr${OMP_NUM_THREADS}_$type/AMD*

# MPI (OpenMPI)
export OMP_NUM_THREADS=1
mpi_tasks=6
type=mpi_prof
mpi_flags="--config hotspots -g --mpi"
mpirun -n $mpi_tasks AMDuProfCLI collect $mpi_flags \
  -o dir_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type
AMDuProfCLI report \
    -g --detail --inline \
    --export-session \
    -i dir_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type/AMD*

# MPI trace (OpenMPI)
#export OMP_NUM_THREADS=1
#mpi_tasks=6
#type=mpi
#mpi_flags="--trace mpi --mpi-impl openmpi"
#mpirun -n ${mpi_tasks} AMDuProfCLI collect $mpi_flags \
#  -o dir_amduprof_o2_unroll_gcc_$type \
#  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_$type
#AMDuProfCLI report -i dir_amduprof_o2_unroll_gcc_$type/AMD*

# MPI trace (OpenMPI) + tbp
export OMP_NUM_THREADS=1
mpi_tasks=6
type=mpi_trace
mpi_flags="--config tbp --trace mpi --mpi-impl openmpi"
mpirun -n ${mpi_tasks} AMDuProfCLI collect $mpi_flags \
  -o dir_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type \
  ./heart_demo_o2_unroll_gcc.x $FLAGS &>out_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type
AMDuProfCLI report \
    -g --detail --inline \
    --export-session \
    -i dir_amduprof_o2_unroll_gcc_mpi${mpi_tasks}_$type/AMD*

