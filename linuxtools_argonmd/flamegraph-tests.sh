#!/bin/bash

# perf installation lacks pre-made scripts

# perf record -a -g -F 99 sleep 60
# perf script report flamegraph
# google-chrome flamegraph.html

# perf record -a -g -F 99 sleep 60
# perf script report gecko 


# some component must be missing, getting missing symbols

# git clone https://github.com/brendangregg/FlameGraph  # or download it from github
# cd FlameGraph
# perf record -F 99 -ag -- sleep 60
# perf script | ./stackcollapse-perf.pl > out.perf-folded
# cat out.perf-folded | ./flamegraph.pl > perf-kernel.svg

