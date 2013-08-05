#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N serial_western_sahara
#$ -o output_serial_western_sahara.txt
#$ -e error_serial_western_sahara.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

echo western_sahara.tsp | ./SerialTSP > output/serial_western_sahara.txt
