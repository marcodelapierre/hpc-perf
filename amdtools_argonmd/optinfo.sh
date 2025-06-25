#!/bin/bash

# AOR
# default one
clang++ -fgen-aor -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp
mv optimization_report.aor aor-vecinfo.out
# specifying output file - however final file content is different from the above
#clang++ -fgen-aor -foptimization-record-file=optinfo.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp


# Rpass report - BEST
# all
clang++ -Rpass -Rpass-missed -Rpass-analysis -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-optinfo.out
## get dynamic list of Rpass types
## grep '\[\-Rpass' rpass-optinfo.out | sed 's;.*\[-Rpass;;g' |sort|uniq
# vec
clang++ -Rpass=loop-vectorize -Rpass-missed=loop-vectorize -Rpass-analysis=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-vecinfo.out
# both loop- and slp- vec
clang++ -Rpass=vectorize -Rpass-missed=vectorize -Rpass-analysis=vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-vecinfo+slp.out
# loops (excl vec)
clang++ -Rpass=loop- -Rpass-missed=loop- -Rpass-skip=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-loopinfo.out
# inline
clang++ -Rpass=inline -Rpass-missed=inline -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-inlineinfo.out
# vec breakdown
clang++ -Rpass=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-vecinfo-passed.out
clang++ -Rpass-missed=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-vecinfo-missed.out
clang++ -Rpass-analysis=loop-vectorize -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_vecinfo.x argonmd.cpp &>rpass-vecinfo-analysis.out



# optimization record - More confusing
# all
clang++ -foptimization-record-file=record-optinfo.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp
# vec
clang++ -foptimization-record-passes=loop-vectorize -foptimization-record-file=record-vecinfo.out -std=c++11 -g -O3 -march=native -funroll-loops -o argonmd_o3_unroll_march_optinfo.x argonmd.cpp
