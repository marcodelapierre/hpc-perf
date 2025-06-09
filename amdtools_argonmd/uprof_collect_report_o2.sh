#!/bin/bash

module purge
module load zen

# collect

for type in hotspots tbp assess branch ibs ; do 
  AMDuProfCLI collect --config $type -g \
    -o dir_amduprof_o2_march_$type \
    ./argonmd_o2_march.x &>out_amduprof_o2_march_$type
done
# oveview does not support -g (callstack)
for type in overview ; do 
  AMDuProfCLI collect --config $type \
    -o dir_amduprof_o2_march_$type \
    ./argonmd_o2_march.x &>out_amduprof_o2_march_$type
done


# report

for type in hotspots tbp overview assess branch ibs ; do
  AMDuProfCLI report -i dir_amduprof_o2_march_$type/AMD*
done
