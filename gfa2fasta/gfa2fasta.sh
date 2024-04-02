#!/bin/bash
#PBS -N gfa2fasta
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=4
#PBS -l mem=16GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue
gfatools_PATH="/g/data/xf3/zz3507/envs/gfatools/gfatools"

# Set the input and output file paths
input_dir="/scratch/xf3/zz3507/result/HiFisam"
output_dir="/scratch/xf3/zz3507/result/HiFisam/AssembleResultV1fasta"

# Set the input file names
input_files=(
  "Ctrap_HiFI_HiC_ONT30KB.hic.hap1.p_ctg.gfa"
  "Ctrap_HiFI_HiC_ONT30KB.hic.hap2.p_ctg.gfa"
  "Ctrap_HiFI_HiC_ONT30KB.hic.p_ctg.gfa"
)

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"


# Convert each GFA file to FASTA format
for input_file in "${input_files[@]}"; do
  output_file="$output_dir/${input_file%.gfa}.fasta"
  "$gfatools_PATH" gfa2fa "$input_dir/$input_file" > "$output_file"
  echo "Converted $input_file to $output_file"
done