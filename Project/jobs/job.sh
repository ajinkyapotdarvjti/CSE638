#!/bin/bash

#$ -V
#$ -cwd
#$ -q development
#$ -pe 12way 12			
#$ -N parallel_cilkview_wikipedia 
#$ -o output_parallel_cilkview_wikipedia
#$ -e error_parallel_cilkview_wikipedia.txt
#$ -M sishirsat@cs.stonybrook.edu
#$ -m be
#$ -l h_rt=01:00:00

export PATH=$PATH:$HOME/cilk/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/cilk/lib

#echo qatar.tsp | ./DJSerial > qatar_serial_output.txt
#echo tsp_dj_input | ./DJSerial > dj_serial_output.txt

#echo qatar.tsp | ./ParallelTSP > output_qatar_parallel.txt
#echo xqg237.tsp | ./ParallelTSP > output_xqg237_parallel.txt
#echo xqf131.tsp | ./ParallelTSP > output_xqf131_parallel.txt
echo pma343.tsp | ./ParallelTSP > output_pma343_parallel.txt
#echo uruguay.tsp | ./ParallelTSP > output_uruguay_parallel.txt
