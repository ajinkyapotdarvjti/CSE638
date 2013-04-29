#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N sequential_rmat1B 
#$ -o output_sequential_rmat1B
#$ -e error_sequential_rmat1B.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/rmat1B-in.txt | ./SequentialBFS output/rmat1B-1a-out.txt > output_sequential_rmat1B

