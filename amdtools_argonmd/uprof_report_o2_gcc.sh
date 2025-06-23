#!/bin/bash

module purge
module load zen

### TO EXPORT SESSION FOR LOCAL GUI USAGE
# use --export-session flag
# retrieve tarball of session files
# make sure to have a local copy of source and binary
# provide path to source and binary in the GUI, while importing session data

# examples of report generation
# NOTE: -g --detail --inline
AMDuProfCLI report -g --detail --inline -i dir_amduprof_o2_gcc_hotspots/AMDuProf-argonmd_o2_gcc-Hotspots_Jun-09-2025_15-35-29/ --report-output detail.csv

# useful categories: cpu openmp mpi
AMDuProfCLI report -g --detail --inline --category cpu -i dir_amduprof_o2_gcc_hotspots/AMDuProf-argonmd_o2_gcc-Hotspots_Jun-09-2025_15-35-29/ --report-output category_cpu.csv

# views: see info --list view-configs
AMDuProfCLI report -g --detail --inline --view timer -i dir_amduprof_o2_gcc_hotspots/AMDuProf-argonmd_o2_gcc-Hotspots_Jun-09-2025_15-35-29/ --report-output view_timer.csv

AMDuProfCLI report -g --detail --inline --view ipc_assess -i dir_amduprof_o2_gcc_assess/AMDuProf-argonmd_o2_gcc-EBP_Jun-09-2025_15-35-41/ --report-output view_ipc_assess.csv

