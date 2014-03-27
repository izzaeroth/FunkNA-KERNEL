#!/bin/bash -e

make clean && ./build/build.sh -j9 2>&1 | tee kernel_build.txt
