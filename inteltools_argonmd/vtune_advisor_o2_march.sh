#!/bin/bash

module purge
. /opt/intel/oneapi/setvars.sh

# run-pass-thru options fix the error `SampleCallback: timestamps aren't ascended`

vtune -collect hotspots -run-pass-thru=-timestamp=sys -r ./vtune_o2_march_hotspots -- ./argonmd_o2_march.x &>out_vtune_o2_march_hotspots
vtune -collect memory-consumption -run-pass-thru=-timestamp=sys -r ./vtune_o2_march_memory_cons -- ./argonmd_o2_march.x &>out_vtune_o2_march_memory_cons

# not available
#vtune -collect uarch-exploration -run-pass-thru=-timestamp=sys -r ./vtune_o2_march_uarch -- ./argonmd_o2_march.x &>out_vtune_o2_march_uarch

#advisor --collect=roofline --project-dir=./adv_o2_march_roof ./argonmd_o2_march.x 16 &>out_adv_o2_march_roof
advisor --collect survey --run-pass-thru timestamp=sys --project-dir ./adv_o2_march -- ./argonmd_o2_march.x &>out_adv_survey_o2_march
advisor --collect tripcounts --flop --no-trip-counts --project-dir ./adv_o2_march -- ./argonmd_o2_march.x &>out_adv_tripcounts_o2_march

