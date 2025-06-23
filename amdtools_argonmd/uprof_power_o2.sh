#!/bin/bash

module purge
module load zen


# note: collected data points are erratically missing from outputs (sometimes all of them)

AMDuProfCLI timechart -e socket,power,temperature -t 100 -o dir_amduprof_o2_power_socket ./argonmd_o2.x

AMDuProfCLI timechart -e core=0-5,power -t 100 -o dir_amduprof_o2_power_cores ./argonmd_o2.x
