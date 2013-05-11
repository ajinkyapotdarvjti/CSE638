#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N ZMortan_PAPI
#$ -o output_z_mm_papi_job
#$ -e error_z_mm_papi_job
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

module load papi/4.1.2.1
./ZMortan_PAPI $1 $2 $3 >> output/z_mm_papi
