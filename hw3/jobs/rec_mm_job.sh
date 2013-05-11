#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N RecMM
#$ -o output_rec_mm_job
#$ -e error_rec_mm_job
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

./RecMM $1 $2 >> output/rec_mm
