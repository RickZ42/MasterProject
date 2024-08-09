#!/bin/bash

#PBS -q normal
#PBS -l mem=100GB
#PBS -l walltime=48:00:00
#PBS -l ncpus=20
#PBS -l jobfs=400GB
#PBS -l wd
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2+gdata/fa63
#PBS -P fa63
set -xue
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V2H2V6ReferenceFinal20240711/H2reference/H2V6/
cp H2V6.First22.FINAL.sorted.fa $PBS_JOBFS
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd $PBS_JOBFS
BuildDatabase -name H2V6.First22.FINAL.sorted -engine ncbi H2V6.First22.FINAL.sorted.fa
RepeatModeler -database H2V6.First22.FINAL.sorted -engine ncbi -threads 20
cp -r $PBS_JOBFS /g/data/xf3/zz3507/Output/AfterHiCProcessing/AnnotationV2/RepeatModeler/H2V6.sorted
