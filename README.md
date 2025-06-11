# hpc-perf
Workflows and examples for HPC performance analysis

## Examples considered
- argonmd molecular dynamics mini-app: https://github.com/marcodelapierre/argonmd
- cardiac fem mini-app: https://github.com/CardiacDemo/Cardiac_demo.git

## Compilers in use
- GNU compiler collection
- AMD AOCC
- Intel oneAPI

## Profilers in use
- Linux `time`
- Linux `gprof`
- Linux `gprofng`
- Linux `perf` tools
- AMD uProf
- Intel vTune and Advisor

## Useful readings
- [`profng` docs](https://sourceware.org/binutils/docs-2.42/gprofng.html)
- [`perf` docs](https://perfwiki.github.io/main)
  - includes good intro to Top-Down Analysis
- [`perf` examples](https://www.brendangregg.com/perf.html)
- [Performance analysis methods](https://www.brendangregg.com/methodology.html)
- [AMD uPRof user guide](https://docs.amd.com/r/en-US/57368-uProf-user-guide)
- [Intel VTune Cookbook](https://www.intel.com/content/www/us/en/docs/vtune-profiler/cookbook/2025-0/overview.html)
- [Intel Advisor Cookbook](https://www.intel.com/content/www/us/en/docs/advisor/cookbook/2024-2/overview.html)
- [Intel article on performance optimisation](https://www.intel.com/content/www/us/en/developer/articles/technical/demystifying-software-performance-optimization.html)
- [Intel vectorisation guide](https://www.intel.com/content/dam/develop/external/us/en/documents/31848-compilerautovectorizationguide.pdf)
- [Intel code examples on GitHub](https://github.com/oneapi-src/oneAPI-samples)
  - includes `oneAPI-samples/Tools/VTuneProfiler/matrix_multiply_c/`
- [Cardiac demo code](https://github.com/CardiacDemo/Cardiac_demo)
- [UoB test code for vectorising compilers](https://github.com/UoB-HPC/TSVC_2)
