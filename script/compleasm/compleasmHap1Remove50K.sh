#!/bin/bash

#PBS -N compleasmhap1
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


input_file="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/assemblyQ720KOntHifiHiCBiggerThan50KContig/hap1/assemblyQ720KOntHifiHiCBigger50Kcontig.hic.hap1_ctg.fasta"
output_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/assemblyQ720KOntHifiHiCBiggerThan50KContig/hap1/compleasm"
lineage_dir="/g/data/xf3/zz3507/database/lineage"
threads=24

compleasm run -a "$input_file" -o "$output_dir" -l embryophyta_odb10 -t "$threads" -L "$lineage_dir"