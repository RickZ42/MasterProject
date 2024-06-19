#!/bin/bash

#PBS -N compleasmhap2500K
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
#PBS -l wd

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/compleasm


input_file="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC500K/assemblyQ720KOntHifiHiC500K.hic.hap2.fasta"
output_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC500K/compleasm"
lineage_dir="/g/data/xf3/zz3507/database/lineage"
threads=24
mkdir "$output_dir"

compleasm run -a "$input_file" -o "$output_dir" -l embryophyta_odb10 -t "$threads" -L "$lineage_dir"