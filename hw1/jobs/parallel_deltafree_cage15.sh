#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N parallel_deltafree_cage15 
#$ -o output_parallel_deltafree_cage15
#$ -e error_parallel_deltafree_cage15.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/cage15-in.txt | ./ParallelBFS_DeltaFree output/cage15-1g-out.txt > output_parallel_deltafree_cage15

