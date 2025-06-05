#!/bin/bash

perf stat ./argonmd_o2.x &>out_perf_stat_o2

perf record -o perf_o2.data ./argonmd_o2.x &>out_perf_record_o2

perf report --stdio -i perf_o2.data &>out_perf_report_o2
perf script -i perf_o2.data &>out_perf_script_o2
