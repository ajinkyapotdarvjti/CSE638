#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N sequential_rmat100M 
#$ -o output_sequential_rmat100M
#$ -e error_sequential_rmat100M.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/rmat100M-in.txt | ./SequentialBFS output/rmat100M-1a-out.txt > output_sequential_rmat100M

