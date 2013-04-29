#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N parallel_deltafree_cilkview_wikipedia 
#$ -o output_parallel_deltafree_cilkview_wikipedia
#$ -e error_parallel_deltafree_cilkview_wikipedia.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/wikipedia-in.txt | cilkview ./ParallelBFS_DeltaFree_CilkView output/wikipedia-parallel-deltafree-cilkview-out.txt output/wikipedia-parallel-delatfree-cilkview-plot > output_parallel__deltafree_cilkview_wikipedia

