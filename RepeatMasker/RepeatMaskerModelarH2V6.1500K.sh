#!/bin/bash

#PBS -q normal
#PBS -l mem=96GB
#PBS -l walltime=48:00:00
#PBS -l ncpus=24
#PBS -l jobfs=400GB
#PBS -l wd
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2+gdata/fa63
#PBS -P fa63
set -xue
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/annotation/RepeatMasker/H2V6.500K
RepeatMasker -pa 24 -e rmblast -gff -xsmall -lib /g/data/xf3/zz3507/Output/AfterHiCProcessing/annotation/H2V6500K/117266376.gadi-pbs/H2V6.500K-families.fa /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0604H1V1.1.H2V6.500K/H2/H2V6.500K.fa