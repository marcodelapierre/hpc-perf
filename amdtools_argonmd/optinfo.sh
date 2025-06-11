#!/bin/bash

# default one
clang++ -fgen-aor -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp
mv optimization_report.aor optinfo.aor

# specifying output file - however final file content is different from the above
clang++ -fgen-aor -foptimization-record-file=optinfo.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp

clang++ -fvectorize -Rpass=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>vecinfo.out

clang++ -fvectorize -Rpass-missed=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>vecinfo-missed.out

clang++ -fvectorize -Rpass-analysis=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>vecinfo-analysis.out
