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
cd /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H1/RepeatMasker
RepeatMasker -pa 24 -e rmblast -gff -xsmall -lib /g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H1/RepeatModeler/123094750.gadi-pbs/AUG17H1V3FFF.500K.20scaffold-families.fa \
/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H1/Genome/AUG17H1V3FFF.500K.20scaffold.fa