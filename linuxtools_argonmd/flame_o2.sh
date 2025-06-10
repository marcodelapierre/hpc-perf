#!/bin/bash

# git clone https://github.com/brendangregg/FlameGraph  # or download it from github

cd FlameGraph

perf record -F 99 -g -- ../argonmd_o2.x &>../out_perf_flame_o2
perf script | ./stackcollapse-perf.pl | ./flamegraph.pl > ../flamegraph_o2.svg
mv perf.data ../perf_flame_o2.data

cd ..

