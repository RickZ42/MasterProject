#!/bin/bash

#PBS -q normal
#PBS -l mem=96GB
#PBS -l walltime=30:00:00
#PBS -l ncpus=24
#PBS -l jobfs=400GB
#PBS -l wd
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2+gdata/fa63
#PBS -P fa63
set -xue
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/AnnotationV2/RepeatMasker/H1V2.sorted
RepeatMasker -pa 24 -e rmblast -gff -xsmall -lib /g/data/xf3/zz3507/Output/AfterHiCProcessing/AnnotationV2/RepeatModeler/H1V2.sorted/H1V2/H1V2Jul8Reference.FINAL.500K.22scaffold.sorted-families.fa \
/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V2H2V6ReferenceFinal20240711/H1reference/0708H1V2FastaJul9/H1V2Jul8Reference.FINAL.500K.22scaffold.sorted.fa