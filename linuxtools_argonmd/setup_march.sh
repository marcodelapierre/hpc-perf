#!/bin/bash

for olev in 0 1 2 3 fast ; do
  g++ -std=c++11 -g -O${olev} -march=native -o argonmd_o${olev}_march.x argonmd.cpp
done
for olev in 3 fast ; do
  g++ -std=c++11 -g -O${olev} -march=native -funroll-loops -o argonmd_o${olev}_unroll_march.x argonmd.cpp
done
