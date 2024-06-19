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
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0604H1V1.1.H2V6.500K/H1
cp H1V1.1.500K.fa $PBS_JOBFS
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd $PBS_JOBFS
BuildDatabase -name H1V1.1.500K -engine ncbi H1V1.1.500K.fa
RepeatModeler -database H1V1.1.500K -engine ncbi -threads 20
cp -r $PBS_JOBFS /g/data/xf3/zz3507/Output/AfterHiCProcessing/annotation/H1V1.1500K
