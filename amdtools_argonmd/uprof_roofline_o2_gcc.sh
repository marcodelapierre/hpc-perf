#!/bin/bash

module purge
module load zen

# roofline unsupported on my laptop
AMDuProfPcm roofline -o out_amduprof_o2_gcc_roofline.csv -- ./argonmd_o2_gcc.x

# obtained eg from command `dmidecode`
memspeed="4800"
AMDuProfModelling.py -i out_amduprof_o2_gcc_roofline.csv -o ./ --memspeed $memspeed -a ./argonmd_o2_gcc.x
