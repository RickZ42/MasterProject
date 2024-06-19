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
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/annotation/RepeatMasker/H1V1.1500K
RepeatMasker -pa 24 -e rmblast -gff -xsmall -lib /g/data/xf3/zz3507/Output/AfterHiCProcessing/annotation/H1V1.1500K/117257362.gadi-pbs/H1V1.1.500K-families.fa /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0604H1V1.1.H2V6.500K/H1/H1V1.1.500K.fa