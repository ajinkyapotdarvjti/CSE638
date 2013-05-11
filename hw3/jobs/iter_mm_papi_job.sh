#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12                 
#$ -N Iter_MM
#$ -o output_iter_mm_papi_job
#$ -e error_iter_mm_papi_job
#$ -M ajinkya288@gmail.com
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib
          
./IterMM_PAPI $1 $2 >> output/iter_mm_papi
