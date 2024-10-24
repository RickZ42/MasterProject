#!/bin/bash
#PBS -N buscoh1
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=48GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

# activate the environment

source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/zz3507/envs/busco

# Set the input and output file paths
input_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/fasta/assemblyQ720KOntHifiHiC.hic.hap2.p_ctg.fasta"
output_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/Busco"


busco_db="/g/data/xf3/zz3507/database/lineage/embryophyta_odb10"




# run busco

busco -i  "$input_dir" -o "$output_dir" -l $busco_db -m geno --cpu 24 -f