#!/bin/bash

sudo sysctl kernel.perf_event_paranoid=0

# amd uprof roofline
#sudo sysctl kernel.nmi_watchdog=0

# intel vtune
sudo sysctl kernel.yama.ptrace_scope=0
