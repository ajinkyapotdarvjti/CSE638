#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12
#$ -N Parallel_Connected_Components
#$ -o Output_job
#$ -e error_job
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

cat /work/01905/rezaul/CSE638/HW2/turn-in/com-lj-in.txt | cilkview ./ParallelCC2_Cilkview $1 output/cilkview_com_lj_$1 > Output_cilkview_com_lj_$1
