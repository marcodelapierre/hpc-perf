#!/bin/bash

perf record -e cycles -e cache-misses -e branch-misses -o perf_events_o2.data ./argonmd_o2.x &>out_perf_events_record_o2

perf report --stdio -i perf_events_o2.data &>out_perf_events_report_o2
