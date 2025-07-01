#!/bin/bash

# should work according to manual, but TopdownL1 metric groups not available
# is it related to cunsomer AMD CPUs??
#perf stat --topdown ./argonmd_o2.x &>out_perf_topdownL1_o2
#perf stat -M TopdownL1 ./argonmd_o2.x &>out_perf_topdownL1_o2_ALT

# Then you would continue based on previous output, eg
#perf stat -M tma_backend_bound_group ./argonmd_o2.x &>out_perf_tma_backend_o2
