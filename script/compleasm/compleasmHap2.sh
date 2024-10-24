#!/bin/bash

#PBS -N compleasmhap2
#PBS -P xf3
#PBS -q express
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/compleasm

input_file="/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H2/Genome/AUG17H2V7FFF.500K.20scaffold.fa"
output_dir="/g/data/xf3/zz3507/Output/AfterHiCProcessing/H1V3H2V7ReferenceAUG17FFF/H2/Genome/compleasm20scaffold"
lineage_dir="/g/data/xf3/zz3507/database/lineage"
threads=24

compleasm run -a "$input_file" -o "$output_dir" -l embryophyta_odb10 -t "$threads" -L "$lineage_dir"