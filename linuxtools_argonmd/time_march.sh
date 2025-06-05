#!/bin/bash

for opt in o0 o1 o2 o3 o3_unroll ofast_unroll ; do
  (time ./argonmd_${opt}_march.x) &>out_time_${opt}_march
done
