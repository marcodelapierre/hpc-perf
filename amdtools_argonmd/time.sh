#!/bin/bash

module purge
module load zen

for opt in o0 o1 o2 o3 ofast o3_unroll o3_zopt ofast_unroll ofast_zopt o3_loop o3_vector o3_memory ; do
  (time ./argonmd_${opt}.x) &>out_time_${opt}
done

for opt in o0 o1 o2 o3 ofast o3_unroll o3_zopt ofast_unroll ofast_zopt ; do
  (time ./argonmd_${opt}_march.x) &>out_time_${opt}_march
done

for opt in o3_amdlibm o3_amdlibm_vec ofast_amdlibm_fast ; do
  (time ./argonmd_${opt}.x) &>out_time_${opt}
done
for opt in o3_amdlibm o3_amdlibm_vec ofast_amdlibm_fast ; do
  (time ./argonmd_${opt}_march.x) &>out_time_${opt}_march
done
