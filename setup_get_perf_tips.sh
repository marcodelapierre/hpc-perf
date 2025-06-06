#!/bin/bash

sudo mkdir -p /usr/share/doc/perf-tip
sudo wget https://raw.githubusercontent.com/torvalds/linux/master/tools/perf/Documentation/tips.txt -O /usr/share/doc/perf-tip/tips.txt
