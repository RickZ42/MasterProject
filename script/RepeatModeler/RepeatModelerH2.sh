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
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H2/Genome/
cp /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H2/Genome/AUG17H2V7FFF.500K.20scaffold.fa $PBS_JOBFS
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd $PBS_JOBFS
BuildDatabase -name AUG17H2V7FFF.500K.20scaffold -engine ncbi AUG17H2V7FFF.500K.20scaffold.fa
RepeatModeler -database AUG17H2V7FFF.500K.20scaffold -engine ncbi -threads 20
cp -r $PBS_JOBFS /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H2/Genome/RepeatModeler
