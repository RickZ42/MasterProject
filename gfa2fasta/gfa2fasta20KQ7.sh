#!/bin/bash
#PBS -N gfa2fasta20KQ7
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=4
#PBS -l mem=16GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2
##PBS -m abe -M u7457512@anu.edu.au

set -xue
gfatools_PATH="/g/data/xf3/zz3507/envs/gfatools/gfatools"

# Set the input and output file paths
input_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC"
output_dir="/g/data/xf3/zz3507/Output/assemblyQ720KOntHifiHiC/fasta"

# Set the input file names
input_files=(
  "assemblyQ720KOntHifiHiC.hic.hap1.p_ctg.gfa"
  "assemblyQ720KOntHifiHiC.hic.hap2.p_ctg.gfa"
  "assemblyQ720KOntHifiHiC.hic.p_ctg.gfa"
)

mkdir -p "$output_dir"



for input_file in "${input_files[@]}"; do
  output_file="$output_dir/${input_file%.gfa}.fasta"
  "$gfatools_PATH" gfa2fa "$input_dir/$input_file" > "$output_file"

done