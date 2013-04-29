#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12	
#$ -N sequential_cage14
#$ -o output_sequential_cage14
#$ -e error_sequential_cage14.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/cage14-in.txt | ./SequentialBFS output/cage14-1a-out.txt > output_sequential_cage14

