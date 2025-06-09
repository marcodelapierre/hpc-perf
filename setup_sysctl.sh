#!/bin/bash

sudo sysctl kernel.perf_event_paranoid=0

# intel vtune
sudo sysctl kernel.yama.ptrace_scope=0
