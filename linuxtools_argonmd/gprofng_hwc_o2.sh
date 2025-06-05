#!/bin/bash
# online docs https://sourceware.org/binutils/docs-2.42/gprofng.html

gprofng collect app -h auto -O gprofng_hwc_o2.er ./argonmd_o2.x &>out_gprofng_hwc_o2

gprofng display text -script script_hwc.gpng gprofng_hwc_o2.er/ &>out_gprofng_hwc_o2_analysis
