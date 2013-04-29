#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N cilk_workstealing
#$ -o cilk_workstealing_output
#$ -e error_cilk_workstealing
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW1/turn-in/$1-in.txt | ./ParallelBFS output/$1-bfs-out.txt > Output_bfs_$1
