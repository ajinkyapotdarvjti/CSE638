#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N serial_pka379
#$ -o output_serial_pka379.txt
#$ -e error_serial_pka379.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

echo pka379.tsp | ./SerialTSP > output/serial_pka379.txt
