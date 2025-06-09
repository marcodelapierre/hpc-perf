#!/bin/bash

module purge
module load zen

AMDuProfCLI info --list collect-configs
AMDuProfCLI info --list predefined-events
AMDuProfCLI info --list pmu-events
AMDuProfCLI info --list view-configs

AMDuProfCLI info --collect-config hotspots
AMDuProfCLI info --collect-config tbp
AMDuProfCLI info --collect-config overview
AMDuProfCLI info --collect-config assess 
AMDuProfCLI info --collect-config branch
AMDuProfCLI info --collect-config ibs

