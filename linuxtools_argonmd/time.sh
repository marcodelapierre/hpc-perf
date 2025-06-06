#!/bin/bash

for opt in o0 o1 o2 o3 ofast o3_unroll o3_unroll_prefetch o3_unroll_prefetch_lto ofast_unroll ; do
  (time ./argonmd_${opt}.x) &>out_time_${opt}
done

for opt in o0 o1 o2 o3 ofast o3_unroll ofast_unroll ; do
  (time ./argonmd_${opt}_march.x) &>out_time_${opt}_march
done
