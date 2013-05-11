#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N RecMM_PAPI
#$ -o output_rec_mm_papijob
#$ -e error_rec_mm_papi_job
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

module load papi/4.1.2.1

./RecMM_PAPI $1 $2 $3  >> output/rec_mm_papi
