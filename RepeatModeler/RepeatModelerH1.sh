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
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V2H2V6ReferenceFinal20240711/H1reference/0708H1V2FastaJul9/
cp H1V2Jul8Reference.FINAL.500K.22scaffold.sorted.fa $PBS_JOBFS
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd $PBS_JOBFS
BuildDatabase -name H1V2Jul8Reference.FINAL.500K.22scaffold.sorted -engine ncbi H1V2Jul8Reference.FINAL.500K.22scaffold.sorted.fa
RepeatModeler -database H1V2Jul8Reference.FINAL.500K.22scaffold.sorted -engine ncbi -threads 20
cp -r $PBS_JOBFS /g/data/xf3/zz3507/Output/AfterHiCProcessing/AnnotationV2/RepeatModeler/H2V6.sorted
