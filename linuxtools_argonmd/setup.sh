#!/bin/bash

git clone git@github.com:marcodelapierre/argonmd
cp argonmd/serial_one_source/argonmd.cpp .

for olev in 0 1 2 3 ; do
  g++ -std=c++11 -g -O${olev} -o argonmd_o${olev}.x argonmd.cpp
done
for olev in 3 fast ; do
  g++ -std=c++11 -g -O${olev} -funroll-loops -o argonmd_o${olev}_unroll.x argonmd.cpp
done
