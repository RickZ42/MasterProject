#!/bin/bash

#PBS -q normal
#PBS -l mem=100GB
#PBS -l walltime=48:00:00
#PBS -l ncpus=24
#PBS -l jobfs=400GB
#PBS -l wd
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2+gdata/fa63
#PBS -P fa63
set -xue
export PATH=/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatMasker:/g/data/xf3/zz3507/app/RepeatMaskerV2/RepeatMasker_setup/RepeatModeler:$PATH
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/AfterJuicerEditing/0604H1V1.1.H2V6.500K/H1
RepeatMasker -pa 24 -q -e rmblast -gff -xsmall -lib /g/data/xf3/zz3507/RawData/Viridiplantae.Repbase/Viridiplantae.Repbase.fasta H1V1.1.500K.fa